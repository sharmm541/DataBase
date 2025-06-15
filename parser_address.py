from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from bs4 import BeautifulSoup
import mysql.connector
import time
import logging
import re

# Настройка логирования
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('address_parser.log'),
        logging.StreamHandler()
    ]
)

def setup_driver():
    """Настройка и запуск веб-драйвера"""
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--disable-blink-features=AutomationControlled")
    chrome_options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")
    chrome_options.add_argument("--window-size=1920x1080")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    
    try:
        driver = webdriver.Chrome(
            service=Service(ChromeDriverManager().install()),
            options=chrome_options
        )
        return driver
    except Exception as e:
        logging.error(f"Ошибка при запуске драйвера: {e}")
        return None

def get_db_connection():
    """Подключение к базе данных"""
    try:
        return mysql.connector.connect(
            host="localhost",
            user="root",
            password="1234",
            database="tniis"
        )
    except mysql.connector.Error as e:
        logging.error(f"Ошибка подключения к БД: {e}")
        return None

def parse_address(raw_address):
    """Разбор и нормализация адреса"""
    try:
        # Очистка адреса
        address = ' '.join(raw_address.strip().split())
        
        # Удаление телефонных номеров и email
        address = re.sub(r'[\+\d\s\-\(\)]{7,}|[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}', '', address)
        
        # Разделение адреса на компоненты
        parts = [p.strip() for p in address.split(',') if p.strip()]
        
        # Определение региона (по умолчанию Ростовская область для Таганрога)
        region = 'Ростовская область'
        city = 'Таганрог'
        building = ''
        
        # Если есть другие компоненты кроме города
        if len(parts) > 1:
            building = ', '.join(parts[1:])
            
        return region, city, building
    except Exception as e:
        logging.error(f"Ошибка нормализации адреса '{raw_address}': {e}")
        return 'Не определено', 'Не определено', raw_address

def scrape_company_addresses(driver, url):
    """Парсинг адресов компаний с одной страницы"""
    try:
        logging.info(f"Загрузка страницы: {url}")
        driver.get(url)
        
        # Ожидание загрузки основного контента
        try:
            WebDriverWait(driver, 15).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, "div.content-list-item"))
            )
        except:
            logging.warning("Не удалось обнаружить список компаний на странице")
            return []
        
        # Добавляем небольшую задержку для полной загрузки
        time.sleep(2)
        
        soup = BeautifulSoup(driver.page_source, 'html.parser')
        addresses = []
        
        # Ищем все элементы компаний
        company_items = soup.select('div.content-list-item')
        
        if not company_items:
            logging.warning("Не найдены компании на странице")
            return []
        
        logging.info(f"Найдено компаний: {len(company_items)}")
        
        for company in company_items:
            # Ищем адрес в третьем div внутри компании
            address_div = company.select('div:nth-child(3) > p:nth-child(3)')
            
            if address_div:
                raw_address = address_div[0].get_text(strip=True)
                region, city, building = parse_address(raw_address)
                addresses.append((region, city, building))
            else:
                logging.warning("Не найден адрес в карточке компании")
                addresses.append(("Не указан", "", ""))
        
        return addresses
    
    except Exception as e:
        logging.error(f"Ошибка парсинга страницы {url}: {str(e)}")
        return []

def main():
    """Основная функция"""
    driver = setup_driver()
    if not driver:
        return
    
    conn = get_db_connection()
    if not conn:
        driver.quit()
        return
    
    try:
        cursor = conn.cursor()
        
        # Создание таблицы с правильным определением внешнего ключа
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS address (
                company_id INT AUTO_INCREMENT PRIMARY KEY,
                region VARCHAR(100),
                city VARCHAR(100),
                building VARCHAR(255),
                INDEX (company_id)
            )
        """)
        
        base_urls = [
            'https://fabricators.ru/zavody/taganrog',
            'https://fabricators.ru/zavody/taganrog?page=1'
        ]
        
        all_addresses = []
        
        for url in base_urls:
            addresses = scrape_company_addresses(driver, url)
            if addresses:
                all_addresses.extend(addresses)
                logging.info(f"Страница {url} обработана, найдено {len(addresses)} адресов")
            else:
                logging.warning(f"Не удалось получить адреса со страницы {url}")
        
        if all_addresses:
            try:
                # Вставляем данные без указания company_id (автоинкремент)
                cursor.executemany("""
                    INSERT INTO address (region, city, building)
                    VALUES (%s, %s, %s)
                """, all_addresses)
                conn.commit()
                logging.info(f"Успешно сохранено {len(all_addresses)} адресов в БД")
            except mysql.connector.Error as e:
                logging.error(f"Ошибка при вставке в БД: {e}")
        else:
            logging.warning("Нет адресов для сохранения")
        
    except Exception as e:
        logging.error(f"Ошибка в основном потоке: {e}")
    finally:
        cursor.close()
        conn.close()
        driver.quit()
        logging.info("Работа завершена")

if __name__ == "__main__":
    main()

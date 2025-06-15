from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from bs4 import BeautifulSoup
from urllib.parse import urljoin
import mysql.connector
import time
import logging
logging.basicConfig(filename='parser.log', level=logging.ERROR)

# --- Настройка Selenium ---
chrome_options = Options()
chrome_options.add_argument("--disable-blink-features=AutomationControlled")
chrome_options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")
chrome_options.add_argument("--headless=new")  # Новый headless-режим Chrome ≥ 114
chrome_options.add_argument("--window-size=1920x1080")  # Разрешение экрана
chrome_options.add_argument("--disable-gpu")  # Ускоряет работу
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")
chrome_options.add_argument("--disable-blink-features=AutomationControlled")
chrome_options.add_experimental_option("excludeSwitches", ["enable-automation"])
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)

# --- Подключение к MySQL ---
def connect_db():
    try:
        return mysql.connector.connect(
            host="localhost",
            user="root",
            password="1234",
            database="tniis"
        )
    except mysql.connector.Error as e:
        print(f"Ошибка подключения к БД: {e}")
        return None

# --- Парсинг данных (с классом title-site--h3) ---
def scrape_page(url):
    try:
        driver.get(url)
        # Явное ожидание загрузки названий
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.CLASS_NAME, "title-site--h3"))
        )
        time.sleep(2)  # Доп. пауза для стабилизации
        
        soup = BeautifulSoup(driver.page_source, 'html.parser')
        company_links = soup.find_all('a', class_='title-site--h3')  # Основной селектор
        
        data = []
        for link in company_links:
            name = link.text.strip()
            href = urljoin(url, link['href'])  # Полная ссылка на компанию
            
            # Описание ищем в ближайшем родительском блоке (адаптивно)
            parent_div = link.find_parent('div')
            desc = parent_div.find('p').text.strip() if parent_div and parent_div.find('p') else "Нет описания"
            
            # Изображение (если нужно)
            img_tag = parent_div.find('img') if parent_div else None
            img = urljoin(url, img_tag['src']) if img_tag and 'src' in img_tag.attrs else ""
            
            data.append((name, desc, img))  # Сохраняем кортеж
            
        return data
    except Exception as e:
        print(f"[!] Ошибка парсинга {url}: {e}")
        return []

# --- Основной скрипт ---
try:
    conn = connect_db()
    if not conn:
        raise Exception("Не удалось подключиться к БД")
    cursor = conn.cursor()

    urls = [
        'https://fabricators.ru/zavody/taganrog',
        'https://fabricators.ru/zavody/taganrog?page=1'
    ]
    
    all_data = []
    for url in urls:
        print(f"[*] Парсинг {url}...")
        page_data = scrape_page(url)
        if page_data:
            all_data.extend(page_data)
            print(f"Найдено: {len(page_data)} записей")
        else:
            print("[!] Данные не извлечены")

    if all_data:
        # Проверка данных перед вставкой
        print("\nПример данных:")
        for i, (name, desc, img) in enumerate(all_data[:2], 1):
            print(f"{i}. {name} | Описание: {desc[:50]}... | Изображение: {img[:30]}...")
        
        # Вставка в MySQL
        cursor.executemany("""
            INSERT INTO company (name, description, image_url)
            VALUES (%s, %s, %s)
            ON DUPLICATE KEY UPDATE
                description=VALUES(description),
                image_url=VALUES(image_url)
        """, all_data)
        conn.commit()
        print(f"\n[√] Успешно сохранено: {len(all_data)} записей")
    else:
        print("[!] Нет данных для сохранения")

except Exception as e:
    print(f"[!] Критическая ошибка: {e}")
finally:
    if 'cursor' in locals(): cursor.close()
    if 'conn' in locals() and conn.is_connected(): conn.close()
    driver.quit()
    print("[×] Ресурсы освобождены")
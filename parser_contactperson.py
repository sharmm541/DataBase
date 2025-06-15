import time
import logging
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

logging.basicConfig(filename='parser.log', level=logging.ERROR)

chrome_options = Options()
chrome_options.add_argument("--disable-blink-features=AutomationControlled")
chrome_options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")
chrome_options.add_argument("--headless=new")
chrome_options.add_argument("--window-size=1920x1080")
chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")
chrome_options.add_argument("--disable-blink-features=AutomationControlled")
chrome_options.add_experimental_option("excludeSwitches", ["enable-automation"])

driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)
wait = WebDriverWait(driver, 15)

def safe_find_text(css_selector):
    try:
        elem = wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, css_selector)))
        return elem.text.strip()
    except Exception as e:
        logging.error(f"Не удалось найти элемент по селектору {css_selector}: {e}")
        return ""

def safe_find_attribute(css_selector, attribute='href'):
    try:
        elem = wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, css_selector)))
        attr = elem.get_attribute(attribute)
        return attr.strip() if attr else ""
    except Exception as e:
        logging.error(f"Не удалось найти элемент по селектору {css_selector}: {e}")
        return ""

def parse_page(url):
    data = {}
    try:
        driver.get(url)
        time.sleep(12)  # ждём загрузки

        data['url'] = url
        data['name'] = safe_find_text("div.content-contact-item__block")

        email_href = safe_find_attribute("a[href^='mailto:']", "href")
        data['email'] = email_href[7:] if email_href.startswith("mailto:") else email_href

        phone_href = safe_find_attribute("a[href^='tel:']", "href")
        data['phone'] = phone_href[4:] if phone_href.startswith("tel:") else phone_href

        data['website'] = safe_find_attribute("a[href^='http']", "href")

    except Exception as e:
        logging.error(f"Ошибка при парсинге страницы {url}: {e}")
    return data
def main():
    results = []
    with open("links.txt", "r", encoding="utf-8") as f:
        links = [line.strip() for line in f if line.strip()]

    for link in links:
        print(f"Парсим: {link}")
        data = parse_page(link)
        results.append(data)
    with open("results.txt", "w", encoding="utf-8") as txt_file:
        for result in results:
            txt_file.write(f"URL: {result.get('url', '')}\n")
            txt_file.write(f"Name: {result.get('name', '')}\n")
            txt_file.write(f"Email: {result.get('email', '')}\n")
            txt_file.write(f"Phone: {result.get('phone', '')}\n")
            txt_file.write(f"Website: {result.get('website', '')}\n")
            txt_file.write("-" * 50 + "\n")

    driver.quit()
    print(f"Парсинг завершён. Результаты в файле results")

if __name__ == "__main__":
    main()
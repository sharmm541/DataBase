import time
import logging
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from concurrent.futures import ThreadPoolExecutor
from queue import Queue

logging.basicConfig(
    filename='parser.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

def init_driver():
    chrome_options = Options()
    chrome_options.add_argument("--disable-blink-features=AutomationControlled")
    chrome_options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")
    chrome_options.add_argument("--headless=new")
    chrome_options.add_argument("--window-size=1920x1080")
    chrome_options.add_argument("--disable-gpu")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    prefs = {"profile.managed_default_content_settings.images": 2}
    chrome_options.add_experimental_option("prefs", prefs)
    
    service = Service(ChromeDriverManager().install())
    return webdriver.Chrome(service=service, options=chrome_options)

def parse_page(driver, url):
    try:
        driver.get(url)
        WebDriverWait(driver, 5).until(
            EC.presence_of_all_elements_located((By.CSS_SELECTOR, "div.field-item a[typeof='skos:Concept']"))
        )
        elements = driver.find_elements(By.CSS_SELECTOR, 'div.field-item a[typeof="skos:Concept"]')
        return [element.text.strip() for element in elements if element.text.strip()]
    except Exception as e:
        logging.error(f"Error parsing {url}: {str(e)}")
        return []

def worker(queue, results, idx):
    driver = init_driver()
    while True:
        item = queue.get()
        if item is None:
            break
        url = item
        company_name = url.split('/')[-1].replace('-', ' ').title()
        products = parse_page(driver, url)
        results[idx[url]] = (company_name, products)
        queue.task_done()
    driver.quit()

def read_links(filename):
    with open(filename, 'r', encoding='utf-8') as f:
        return [line.strip() for line in f if line.strip() and line.startswith('http')]

def main():
    links = read_links('links.txt')
    print(f"Найдено ссылок: {len(links)}")
    
    start_time = time.time()
    
    queue = Queue()
    results = [None] * len(links)
    idx = {url: i for i, url in enumerate(links)}
    
    for url in links:
        queue.put(url)
    
    num_workers = 5  # можно увеличить, если ресурсы позволяют
    threads = []
    for _ in range(num_workers):
        t = threading.Thread(target=worker, args=(queue, results, idx))
        t.start()
        threads.append(t)
    
    queue.join()
    
    # Останавливаем потоки
    for _ in range(num_workers):
        queue.put(None)
    for t in threads:
        t.join()
    
    with open('companyproduct.txt', 'w', encoding='utf-8') as f:
        for company_name, products in results:
            f.write(f"Компания: {company_name}\n")
            f.write("Продукты:\n")
            f.write("\n".join(products))
            f.write("\n\n")
    
    print(f"Парсинг завершен. Обработано компаний: {len(results)}")
    print(f"Время выполнения: {time.time() - start_time:.2f} секунд")

if __name__ == "__main__":
    import threading
    main()

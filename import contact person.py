import re
import random
import mysql.connector
from mysql.connector import Error

# Конфигурация базы данных
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': '1234',
    'database': 'tniis'
}

def create_connection():
    """Создает соединение с MySQL"""
    try:
        return mysql.connector.connect(**DB_CONFIG)
    except Error as e:
        print(f"Ошибка подключения к MySQL: {e}")
        return None

def create_table_if_not_exists(conn):
    """Создает таблицу если она не существует"""
    try:
        cursor = conn.cursor()
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS contactperson (
                contact_id INT AUTO_INCREMENT PRIMARY KEY,
                company_id INT,
                name VARCHAR(255),
                phone VARCHAR(50),
                email VARCHAR(100),
                website VARCHAR(255),
                FOREIGN KEY (company_id) REFERENCES company(company_id)
            )
        """)
        conn.commit()
    except Error as e:
        print(f"Ошибка при создании таблицы: {e}")

def parse_results_file(filename):
    """Парсит файл results.txt и возвращает список словарей с данными"""
    records = []
    current_record = {}
    company_id_counter = 1  
    with open(filename, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if line.startswith('URL:'):
                current_record['url'] = line[4:].strip()
            elif line.startswith('Name:'):
                current_record['name'] = line[5:].strip()
            elif line.startswith('Phone:'):
                current_record['phone'] = line[6:].strip()
            elif line.startswith('Email:'):
                current_record['email'] = line[6:].strip()
            elif line.startswith('Website:'):
                current_record['website'] = line[8:].strip()
            elif line.startswith('-' * 50):
                if current_record:
                    # Генерируем случайный company_id от 1 до 30
                    current_record['company_id'] = company_id_counter
                    company_id_counter += 1
                    if company_id_counter > 30:
                        company_id_counter = 1
                    records.append(current_record)
                    current_record = {}
    
    return records

def insert_data_to_db(conn, records):
    """Вставляет данные в таблицу contactperson"""
    try:
        cursor = conn.cursor()
        inserted_rows = 0
        
        for record in records:
            # Проверяем обязательные поля
            if not all(key in record for key in ['name', 'phone', 'email', 'website']):
                print(f"Пропущена запись с неполными данными: {record}")
                continue
                
            # Проверяем, есть ли уже такая запись
            cursor.execute("""
                SELECT 1 FROM contactperson 
                WHERE name = %s AND phone = %s AND email = %s
                LIMIT 1
            """, (record['name'], record['phone'], record['email']))
            
            if not cursor.fetchone():
                cursor.execute("""
                    INSERT INTO contactperson (company_id, name, phone, email, website)
                    VALUES (%s, %s, %s, %s, %s)
                """, (
                    record.get('company_id', random.randint(1, 30)),  # На случай если company_id не установлен
                    record['name'],
                    record['phone'],
                    record['email'],
                    record['website']
                ))
                inserted_rows += 1
        
        conn.commit()
        print(f"Успешно добавлено {inserted_rows} записей из {len(records)}")
        
    except Error as e:
        print(f"Ошибка при вставке данных: {e}")
        conn.rollback()

def main():
    # Создаем соединение с БД
    conn = create_connection()
    if not conn:
        return
    
    try:
        # Создаем таблицу если ее нет
        create_table_if_not_exists(conn)
        
        # Парсим файл с результатами
        records = parse_results_file('results.txt')
        print(f"Найдено {len(records)} записей для импорта")
        
        # Вставляем данные в БД
        insert_data_to_db(conn, records)
        
    finally:
        if conn.is_connected():
            conn.close()
            print("Соединение с MySQL закрыто")

if __name__ == "__main__":
    main()
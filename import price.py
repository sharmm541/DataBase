import mysql.connector

def insert_prices_from_file_mysql(host, user, password, database, price_file_path):
    # Читаем файл и группируем цены по блокам (разделённым пустой строкой)
    with open(price_file_path, 'r', encoding='utf-8') as f:
        blocks = []
        current_block = []
        for line in f:
            line = line.strip()
            if line == '':
                if current_block:
                    blocks.append(current_block)
                    current_block = []
            else:
                current_block.append(line)
        if current_block:
            blocks.append(current_block)

    # Подключаемся к MySQL
    conn = mysql.connector.connect(
        host=host,
        user=user,
        password=password,
        database=database,
        charset='utf8mb4'
    )
    cursor = conn.cursor()

    # Фиксированная категория для всех вставляемых записей
    insert_query = "INSERT INTO products (category_id, price) VALUES (%s, %s)"

    for i, price_block in enumerate(blocks, start=1):
        price_str = ', '.join(price_block)
        cursor.execute(insert_query, (i, price_str))
    conn.commit()
    cursor.close()
    conn.close()
    print("Вставка цен завершена успешно.")

if __name__ == "__main__":
    host = 'localhost'
    user = 'root'
    password = '1234'
    database = 'tniis'
    price_file_path ='C:\\Users\\User\\Desktop\\price.txt'

    insert_prices_from_file_mysql(host, user, password, database, price_file_path)

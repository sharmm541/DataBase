import mysql.connector

def insert_services_groups_from_file_mysql(host, user, password, database, services_file_path):
    # Читаем файл и группируем строки по блокам, разделённым пустой строкой
    with open(services_file_path, 'r', encoding='utf-8') as f:
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

    insert_query = "INSERT INTO services (category_name) VALUES (%s)"

    for block in blocks:
        # Объединяем услуги в одну строку, например через запятую и пробел
        services_str = ', '.join(block)
        cursor.execute(insert_query, (services_str,))

    conn.commit()
    cursor.close()
    conn.close()
    print("Вставка групп услуг завершена успешно.")

if __name__ == "__main__":
    host = 'localhost'
    user = 'root'
    password = '1234'
    database = 'tniis'
    services_file_path = r'C:\Users\User\Desktop\services.txt'

    insert_services_groups_from_file_mysql(host, user, password, database, services_file_path)

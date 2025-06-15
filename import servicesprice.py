import mysql.connector

def insert_prices_from_file_mysql(host, user, password, database, price_file_path):
    # Читаем файл с ценами, каждая строка — одна цена, пустые строки игнорируем
    prices = []
    with open(price_file_path, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if line:
                prices.append(line)

    # Подключаемся к MySQL
    conn = mysql.connector.connect(
        host=host,
        user=user,
        password=password,
        database=database,
        charset='utf8mb4'
    )
    cursor = conn.cursor()

    # Запрос вставки цены в таблицу services
    insert_query = "INSERT INTO services (price) VALUES (%s)"

    for price_str in prices:
        # Преобразуем строку цены в decimal, учитываем, что цена может быть с десятичной точкой
        # Если в файле есть единицы измерения, их нужно убрать, но из вашего файла там только цифры
        try:
            price_decimal = float(price_str)
        except ValueError:
            print(f"Не удалось преобразовать цену '{price_str}' в число. Пропускаем.")
            continue

        cursor.execute(insert_query, (price_decimal,))

    conn.commit()
    cursor.close()
    conn.close()
    print("Вставка цен завершена успешно.")


if __name__ == "__main__":
    host = 'localhost'
    user = 'root'
    password = '1234'
    database = 'tniis'
    price_file_path = r'C:\Users\User\Desktop\serviceprice.txt'

    insert_prices_from_file_mysql(host, user, password, database, price_file_path)

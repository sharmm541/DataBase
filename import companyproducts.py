import mysql.connector

def parse_products_only(filename):
    products_list = []
    with open(filename, 'r', encoding='utf-8') as f:
        lines = [line.strip() for line in f]

    products = []
    for line in lines:
        if line == '':
            continue
        if line.startswith('Компания:'):
            # если уже накопились продукты предыдущей компании — сохранить
            if products:
                products_str = ", ".join(products)
                products_list.append(products_str)
                products = []
            # новая компания — просто начинаем собирать продукты заново
        else:
            products.append(line)

    # сохранить продукты последней компании
    if products:
        products_str = ", ".join(products)
        products_list.append(products_str)

    return products_list
def insert_products_to_db(products_list):
    # Настройте параметры подключения под вашу БД
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='1234',
        database='tniis'
    )
    cursor = conn.cursor()

    for products in products_list:
        # Вставляем объединённые продукты в поле name
        cursor.execute("INSERT INTO productcategory (name) VALUES (%s)", (products,))

    conn.commit()
    print(f"Вставлено {cursor.rowcount} записей в таблицу productcategory.")
    cursor.close()
    conn.close()

if __name__ == "__main__":
    products = parse_products_only(r"C:\Users\User\Desktop\productcategory.txt")
    print(f"Найдено компаний: {len(products)}")
    insert_products_to_db(products)

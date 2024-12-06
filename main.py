import sqlite3

db_path = 'recods.db'

def main():
    try:
        conn = sqlite3.connect(db_path)
    except sqlite3.Error as e:
        print(f"Error connecting to database: {e}")
        exit(f"Error connecting to database: {e}")
    
    cursor = conn.cursor()

    cursor.execute('SELECT * FROM records')
    for row in cursor.fetchall():
        print(row)

    conn.close()
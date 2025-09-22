#!/usr/bin/env python3

import mysql.connector
from mysql.connector import Error

def test_mysql_connection():
    try:
        print("🔌 Testing MySQL connection...")
        
        # Connect to MySQL server
        connection = mysql.connector.connect(
            host='localhost',
            port=3306,
            user='root',
            password='root',
            database='common_appointment_db'
        )
        
        if connection.is_connected():
            print("✅ Successfully connected to MySQL!")
            
            cursor = connection.cursor()
            
            # Check existing tables
            cursor.execute("SHOW TABLES")
            tables = cursor.fetchall()
            print(f"📋 Available tables: {[table[0] for table in tables]}")
            
            # Test a simple query
            if 'doctors' in [table[0] for table in tables]:
                cursor.execute("SELECT COUNT(*) FROM doctors")
                count = result.fetchone()[0]
                print(f"📊 Doctors table has {count} records")
            
            cursor.close()
            connection.close()
            print("✅ Connection closed successfully!")
            return True
            
    except Error as e:
        print(f"❌ MySQL Error: {e}")
        return False
    except Exception as e:
        print(f"❌ General Error: {e}")
        return False

if __name__ == "__main__":
    success = test_mysql_connection()
    if success:
        print("🎉 MySQL connection test successful!")
    else:
        print("💥 MySQL connection test failed!")

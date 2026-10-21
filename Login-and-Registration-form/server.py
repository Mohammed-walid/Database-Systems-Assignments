"""This module is used for web deployment"""

from flask import Flask, render_template, request, jsonify, session, redirect, url_for
import mysql.connector
import hashlib

app = Flask(__name__)
app.secret_key = 'super_secret_lab_key'

def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",  # Default XAMPP password is empty
        database="registration"
    )

@app.route('/')
def index():
    if 'user_name' in session:
        return redirect(url_for('welcome'))
    return render_template('index.html')

@app.route('/register', methods=['POST'])
def register():
    name = request.form.get('name')
    email = request.form.get('email')
    password = request.form.get('password')

    # Bonus: Save encrypted MD5 password
    hashed_pw = hashlib.md5(password.encode()).hexdigest()

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Check if email already exists
    cursor.execute("SELECT * FROM user WHERE email = %s", (email,))
    if cursor.fetchone():
        cursor.close()
        conn.close()
        return jsonify({"status": "error", "message": "Email Already Exists"})

    # Insert new record in the User table
    cursor.execute(
        "INSERT INTO user (email, name, password) VALUES (%s, %s, %s)",
        (email, name, hashed_pw)
    )
    conn.commit()
    cursor.close()
    conn.close()

    session['user_name'] = name
    return jsonify({"status": "success"})

@app.route('/login', methods=['POST'])
def login():
    email = request.form.get('email')
    password = request.form.get('password')

    hashed_pw = hashlib.md5(password.encode()).hexdigest()

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Run a query to select user data by provided email and password
    cursor.execute("SELECT * FROM user WHERE email = %s AND password = %s", (email, hashed_pw))
    user = cursor.fetchone()
    cursor.close()
    conn.close()

    if user:
        session['user_name'] = user['name']
        return jsonify({"status": "success"})
    else:
        return jsonify({"status": "error", "message": "Invalid email or password."})

@app.route('/welcome')
def welcome():
    if 'user_name' not in session:
        return redirect(url_for('index'))
    return render_template('welcome.html', name=session['user_name'])

@app.route('/logout')
def logout():
    session.pop('user_name', None)
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
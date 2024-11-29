from flask import Flask,render_template,request,jsonify
from src import sql_connector
from dotenv import load_dotenv
import os

load_dotenv()
username = os.environ['USER_NAME']
password = os.environ['PASSWORD']
# Define sql connector 
con = sql_connector.sqlConnector()
con.connect(username,password, "localhost", "chemical_database")


app = Flask (__name__)

@app.route('/')
def intro():

    return render_template('login.html')

@app.route('/login',methods = ['POST'])
def login():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')

    if username == 'admin' and password == 'password123':
        return jsonify({"message":"Valid Credentials"}), 200
    else:
        return jsonify({"message":"Invalid Credentials, Login Unsuccessful"}), 401


@app.route('/user')
def user():
    return render_template('pharmacy.html')

@app.route('/get_customers', methods=['GET'])
def get_customers():
    # Example customer list (replace with database query)
    customers = con.query("SELECT * FROM chemical_database.customer order by first_name;")
    return jsonify(customers)

@app.route('/get_doctors', methods=['GET'])
def get_doctors():
    # Example customer list (replace with database query)
    doctors = con.query("SELECT * FROM chemical_database.doctor order by first_name;")
    return jsonify(doctors)

@app.route('/user_setting')
def setting():
    return render_template('pharmacist_profile.html')


if __name__ == '__main__':
    
    app.run()


from flask import Flask,render_template,request,jsonify
from src import sql_connector

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


if __name__ == '__main__':

    con = sql_connector.sqlConnector()
    con.connect("root", "root", "localhost", "chemical_database")

    print(con.query("SELECT * FROM chemical_database.customer;"))

    #app.run()
from flask import Flask,render_template,request,jsonify
from src import sql_connector
from dotenv import load_dotenv
import os

load_dotenv()
username = os.environ['USER_NAME']
password = os.environ['PASSWORD']


# Define sql connector 
try:
    con = sql_connector.sqlConnector()
    con.connect(username, password, "localhost", "chemical_database")
    print("Successfully Connected")

except Exception as e:
    print("Not connecting")
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
    #return render_template('orders_list.html')


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


def addDashesToPhoneNumber(number: str):
    return number[:3] + '-' + number[3:6] + '-' + number[6:] 


@app.route('/get_customer_info', methods=['GET'])
def get_customer_info():

    customer_id = request.args.get('id').split()

    customer = con.query(f"SELECT * FROM chemical_database.customer cu WHERE cu.first_name = '{customer_id[0]}' and cu.last_name = '{customer_id[1]}';")

    customer[0]["phone"] = addDashesToPhoneNumber(customer[0]["phone"])
 
    customer = customer[0]

    customer_orders = con.query(f"SELECT * FROM orders o JOIN picks_up pi ON o.order_id = pi.order_id JOIN customer cu ON pi.customer_id = cu.insurance_id WHERE cu.first_name = '{customer_id[0]}' and cu.last_name = '{customer_id[1]}';")

    for orderInd in range(len(customer_orders)):
        orderNumber = customer_orders[orderInd]['order_id']
        prescriptions = con.query(f"SELECT * FROM prescription pre JOIN contains con ON pre.val = con.prescription_id WHERE order_id = {orderNumber};")
        # prescriptions = con.query(f"SELECT * FROM prescription pre JOIN contains con ON pre.val = con.prescription_id WHERE order_id = (SELECT o.order_id FROM orders o JOIN picks_up pi ON o.order_id = pi.order_id JOIN customer cu ON pi.customer_id = cu.insurance_id WHERE cu.first_name = '{customer_id[0]}' and cu.last_name = '{customer_id[1]}');")
        customer_orders[orderInd]["prescriptions"] = prescriptions

    customer["orders"] = customer_orders

    return jsonify(customer)



@app.route('/get_doctor_info', methods=['GET'])
def get_doctor_info():

    doctor_id = request.args.get('id').split()

    doctor = con.query(f"SELECT * FROM chemical_database.doctor do WHERE do.first_name = '{doctor_id[0]}' and do.last_name = '{doctor_id[1]}';")

    doctor[0]["phone"] = addDashesToPhoneNumber(doctor[0]["phone"])
 
    print(doctor[0])
    return jsonify(doctor[0])

@app.route('/get_pharmacists', methods =['GET'])
def get_pharmacy():
    pharmacist = con.query(f"SELECT * from pharmacist ORDER BY first_name;")

    return jsonify(pharmacist)

@app.route('/get_pharmacist_details', methods=['GET'])
def get_pharmacy_info():
    pharmacist_id = request.args.get('name').split()
    pharmacist_id = request.args.get('name').split()
    # print("Pharmacist ID:", pharmacist_id)

    # if len(pharmacist_id) != 2:
    #     return jsonify({"error": "Invalid name format. Expected 'first_name last_name'."}), 400

    try:
        # SQL Query
        query = f"""
            SELECT pharmacist.first_name, pharmacist.last_name,
           pharmacist.pharmacy_store_name AS pharmacy_store_name,
           pharmacist.pharmacy_address_street_name AS address_street_name,
           pharmacist.pharmacy_address_street_num AS address_street_num,
           pharmacist.pharmacy_address_town AS address_town,
           pharmacist.pharmacy_address_state AS address_state,
           pharmacist.pharmacy_address_zipcode AS address_zipcode,
           certification.name AS certification_name,
           certification.institution,
           certification.expiration_date AS expiration_date
            FROM pharmacist
            JOIN obtains_pharmacist ON pharmacist.first_name = obtains_pharmacist.first_name
                                AND pharmacist.last_name = obtains_pharmacist.last_name
            JOIN certification ON obtains_pharmacist.certification_name = certification.name
            WHERE pharmacist.first_name = '{pharmacist_id[0]}' AND pharmacist.last_name = '{pharmacist_id[1]}';
        """

        # Execute the query
        pharmacist_data = con.query(query)

        # Check if query returned data
        if not pharmacist_data:
            return jsonify({"error": "No data found for the selected pharmacist"}), 404

        # Process the result
        result = []
        for row in pharmacist_data:
            result.append({
                "first_name": row["first_name"],
                "last_name": row["last_name"],
                "pharmacy_store_name": row["pharmacy_store_name"],
                "pharmacy_store_address_street_name": row["address_street_name"],
                "pharmacy_store_address_street_num": row["address_street_num"],
                "pharmacy_address_town": row["address_town"],
                "pharmacy_address_state": row["address_state"],
                "pharmacy_address_zipcode": row["address_zipcode"],
                "certification_name": row["certification_name"],
                "institution": row["institution"],
                "expiration_date": row["expiration_date"],
            })
        # result =[]
        # print(result)
        return jsonify(result)

    except Exception as e:
        # Log the exception for debugging
        print("Error executing query:", e)
        return jsonify({"error": str(e)}), 500


@app.route('/get_orders', methods=['GET'])
def get_orders_for_customer():

    #doctor_id = request.args.get('id').split()

    #doctor = con.query(f"SELECT * FROM chemical_database.doctor do WHERE do.first_name = '{doctor_id[0]}' and do.last_name = '{doctor_id[1]}';")

    #doctor[0]["phone"] = addDashesToPhoneNumber(doctor[0]["phone"])
 
    orders = [
        {
            "first_name" : "John",
            "last_name" : "Carter",
            "phone" : "456-345-0982",
            "email" : "johnCart@gmail.com",
            "orders" : [
                {
                    "order_id" : 1244, 
                    "expiration_date" : "2024-12-01",
                    "doctor_first_name" : "Johnson",
                    "prescriptions" : [
                        {
                            "val" : 1,
                            "expiration_date" : "2025-12-01",
                            "quantity" : 50,
                            "dosage" : 130
                        },
                        {
                            "val" : 2,
                            "expiration_date" : "2025-12-01",
                            "quantity" : 100,
                            "dosage" : 130

                        }
                    ]

                },
                {
                    "order_id" : 1346, 
                    "expiration_date" : "2024-07-05",
                    "doctor_first_name" : "Jein",
                    "prescriptions" : [

                    ]
                },
                {
                    "order_id" : 5434, 
                    "expiration_date" : "2024-04-09",
                    "doctor_first_name" : "Gene",
                    "prescriptions" : [
                        {
                            "val" : 3,
                            "expiration_date" : "2025-12-01",
                            "quantity" : 100,
                            "dosage" : 50
                        }
                    ]
                }
            ]

        }
    ]

    return jsonify(orders)


    
@app.route('/user_setting')
def setting():
    return render_template('pharmacist_profile.html')


if __name__ == '__main__':
    
    app.run()


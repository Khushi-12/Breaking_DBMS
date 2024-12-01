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

    customer = con.query(f"SELECT * FROM chemical_database.customer cu JOIN chemical_database.insurance_company ic ON cu.insurance_name = ic.name WHERE cu.first_name = '{customer_id[0]}' and cu.last_name = '{customer_id[1]}';")

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

    try: 
        # SQL query to fetch doctor details and certifications
        doctor_query = f"""
            SELECT 
                do.first_name,
                do.last_name,
                do.email,
                do.phone,
                do.specialty,
                do.office_name,
                do.office_address_street_name,
                do.office_address_street_num,
                do.office_address_town,
                do.office_address_state,
                do.office_address_zipcode,
                c.name,
                c.institution,
                c.expiration_date
            FROM chemical_database.doctor do
            JOIN obtains_doctor ON do.first_name = obtains_doctor.first_name
            AND do.last_name = obtains_doctor.last_name
            JOIN certification c ON obtains_doctor.certification_name = c.name
            WHERE do.first_name = '{doctor_id[0]}'
            AND do.last_name = '{doctor_id[1]}';
        """

        doctor_rows = con.query(doctor_query)  # Fetch all matching rows
        
        if not doctor_rows:
            return jsonify({"error": "Doctor not found"}), 404

        # Extract basic doctor information from the first row
        doctor_info = {
            "first_name": doctor_rows[0]["first_name"],
            "last_name": doctor_rows[0]["last_name"],
            "email": doctor_rows[0]["email"],
            "phone": addDashesToPhoneNumber(doctor_rows[0]["phone"]),
            "specialty": doctor_rows[0]["specialty"],
            "office_name": doctor_rows[0]["office_name"],
            "office_address_street_name": doctor_rows[0]["office_address_street_name"],
            "office_address_street_num": doctor_rows[0]["office_address_street_num"],
            "office_address_town": doctor_rows[0]["office_address_town"],
            "office_address_state": doctor_rows[0]["office_address_state"],
            "office_address_zipcode": doctor_rows[0]["office_address_zipcode"],
            "certifications": []
        }

        # Add certifications to the doctor_info object
        for row in doctor_rows:
            doctor_info["certifications"].append({
                "certification_name": row["name"],
                "institution": row["institution"],
                "expiration_date": row["expiration_date"].strftime("%Y-%m-%d")  # Convert date to string
            })
        
        return jsonify(doctor_info)
    except Exception as e:
        print("Error executing query:", e)
        return jsonify({"error": str(e)}), 500

    
# doctor[0]["phone"] = addDashesToPhoneNumber(doctor[0]["phone"])
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
           pharmacy_store.name AS pharmacy_store_name,
           pharmacy_store.address_street_name AS address_street_name,
           pharmacy_store.address_street_num AS address_street_num,
           pharmacy_store.address_town AS address_town,
           pharmacy_store.address_state AS address_state,
           pharmacy_store.address_zipcode AS address_zipcode,
           certification.name AS certification_name,
           certification.institution,
           certification.expiration_date AS expiration_date
            FROM pharmacist
            JOIN pharmacy_store ON pharmacist.pharmacy_id = pharmacy_store.pharmacy_id
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

    
@app.route('/user_setting')
def setting():
    return render_template('pharmacist_profile.html')

@app.route('/add_new')
def add_new():
    return render_template('add_new.html')

@app.route('/modify')
def modify():
    return render_template('modify.html')

@app.route('/delete')
def delete():
    return render_template('delete.html')

if __name__ == '__main__':
    
    app.run()


from flask import Flask, render_template, request, jsonify, redirect, url_for

from src import sql_connector
from dotenv import load_dotenv
import os

load_dotenv()
username = os.environ['USER_NAME']
password = os.environ['PASSWORD']

app = Flask(__name__)

pharmacist_credentials = {
    'username': 'admin',
    'password': 'password123'
}

customer_credentials = {
    'username': 'cust',
    'password': 'password123'
}

def get_con(): 
    con = sql_connector.sqlConnector()
    con.connect(username, password, "localhost", "chemical_database")
    return con

@app.route('/')
def intro():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']
    
    if username == pharmacist_credentials['username'] and password == pharmacist_credentials['password']:
        return redirect(url_for('pharmacist_dashboard'))
    else:
        return jsonify({"message": "Invalid Credentials, Login Unsuccessful"}), 401

@app.route('/customer_login')
def customer_login_page():
    return render_template('customer_login.html')


@app.route('/customer_login', methods=['POST'])
def customer_login():
    username = request.form['username']
    password = request.form['password']

    con = get_con()
    try:
        # Query the database to check if the email exists
        customer = con.query("""
            SELECT * FROM chemical_database.customer
            WHERE email = %s;
        """, (username,))

        if customer and password == "password123":  
            return redirect(url_for('customer_dashboard', email=username))
        else:
            # Invalid credentials
            return jsonify({"message": "Invalid Credentials, Login Unsuccessful"}), 401
    finally:
        con.close()


@app.route('/pharmacist_dashboard')
def pharmacist_dashboard():
    return render_template('main.html')

@app.route('/customer_dashboard')
def customer_dashboard():
    customer_email = request.args.get('email')

    if not customer_email:
        return redirect(url_for('customer_login_page'))

    con = get_con()
    try:
        customer_info = con.query("""
            SELECT * FROM chemical_database.customer
            WHERE email = %s;
        """, (customer_email,))
        if customer_info:
            customer_info = customer_info[0]
            customer = con.query("""
                CALL GetCustomerInfo(%s, %s);
                """, (customer_info['first_name'], customer_info['last_name']))


            if not customer:
                return jsonify({"error": "Customer not found"}), 404

            customer[0]["phone"] = addDashesToPhoneNumber(customer[0]["phone"])
            customer = customer[0]

            customer_orders = con.query("""
                CALL GetCustomerOrdersCDash(%s, %s);
                    """, (customer_info['first_name'], customer_info['last_name']))


            for order in customer_orders:
                order_number = order['order_id']
                prescriptions = con.query("""
                    CALL GetPrescriptionDetails(%s);
                    """, (order_number,))

                order["prescriptions"] = prescriptions

            customer["orders"] = customer_orders

            return render_template('customer_dash.html', customer=customer)
        else:
            return jsonify({"error": "Customer not found"}), 404
    finally:
        con.close()



@app.route('/customers')
def display_customer():
    return render_template('customer.html')

@app.route('/get_customers', methods=['GET'])
def get_customers():
    con = get_con()
    try:
        customers = con.query("SELECT * FROM chemical_database.customer ORDER BY first_name;")
        return jsonify(customers)
    finally:
        con.close()

@app.route('/get_doctors', methods=['GET'])
def get_doctors():
    con = get_con()
    try:
        doctors = con.query("SELECT * FROM chemical_database.doctor ORDER BY first_name;")
        return jsonify(doctors)
    finally:
        con.close()

@app.route('/get_meds', methods=['GET'])
def get_meds():
    con = get_con()
    try:
        meds = con.query("SELECT * FROM chemical_database.medication ORDER BY common_name;")
        return jsonify(meds)
    finally:
        con.close()
    


def addDashesToPhoneNumber(number: str):
    return f"{number[:3]}-{number[3:6]}-{number[6:]}"

@app.route('/get_customer_info', methods=['GET'])
def get_customer_info():
    customer_id = request.args.get('id').split()
    con = get_con()
    try:
        customer = con.query("""
            CALL GetCustomerInfo(%s, %s);
            """, (customer_id[0], customer_id[1]))


        if not customer:
            return jsonify({"error": "Customer not found"}), 404

        customer[0]["phone"] = addDashesToPhoneNumber(customer[0]["phone"])
        customer = customer[0]

        customer_orders = con.query("""
            CALL GetCustomerOrdersMain(%s, %s);
            """, (customer_id[0], customer_id[1]))

        for order in customer_orders:
            order_number = order['order_id']
            prescriptions = con.query("""
                    CALL GetPrescriptionDetails(%s);
                    """, (order_number,))
            order["prescriptions"] = prescriptions

        customer["orders"] = customer_orders

        return jsonify(customer)
    finally:
        con.close()

@app.route('/get_customer_infos', methods=['GET'])
def get_customer_infos():
    customer_id = request.args.get('id').split()
    con = get_con()
    try:
        customer = con.query("CALL GetCustomerInfo(%s, %s)",(customer_id[0],customer_id[1]))

        if not customer:
            return jsonify({"error": "Customer not found"}), 404

        customer[0]["phone"] = addDashesToPhoneNumber(customer[0]["phone"])
        customer = customer[0]

        customer_orders = con.query(f"""
            CALL GetCustomerOrdersMain(%s,%s)
        """, (customer_id[0], customer_id[1]))

        for order in customer_orders:
            order_number = order['order_id']
            prescriptions = con.query("""
                    CALL GetPrescriptionDetails(%s);
                    """, (order_number,))
            order["prescriptions"] = prescriptions

        customer["orders"] = customer_orders

        return jsonify(customer)
    finally:
        con.close()

@app.route('/get_doctor_info', methods=['GET'])
def get_doctor_info():
    doctor_id = request.args.get('id').split()
    # print(type(doctor_id[0]),doctor_id[1])
    con = get_con()
    try:
        doctor_query = "CALL GetDoctorDetails(%s, %s)"
        doctor_rows = con.query(doctor_query, (doctor_id[0], doctor_id[1]))


        if not doctor_rows:
            return jsonify({"error": "Doctor not found"}), 404

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

        for row in doctor_rows:
            doctor_info["certifications"].append({
                "certification_name": row["name"],
                "institution": row["institution"],
                "expiration_date": row["expiration_date"].strftime("%Y-%m-%d")
            })

        return jsonify(doctor_info)
    finally:
        con.close()

@app.route('/get_medication_info', methods=['GET'])
def get_medication_info():
    con =get_con()
    med_id = request.args.get('id')

    med = con.query(f"SELECT * FROM chemical_database.medication med WHERE med.scientific_name = '{med_id}';")

    
    uses_query = "CALL GetMedicationDetails(%s)"
    uses = con.query(uses_query, (med_id))

    
    chemicals_query = "CALL GetMedicationDetailsComposedOf(%s)"
    chemicals = con.query(chemicals_query, (med_id))

    med =med[0]
    med["uses"] = uses

    for chemInd in range(len(chemicals)):
        chemName = chemicals[chemInd]['chemical_scientific_name']
        hazards = con.query("CALL GetchemicalDetails(%s)",(med_id))
        
        chemicals[chemInd]["hazards"] = hazards

    med["chemicals"] = chemicals


    return jsonify(med)


@app.route('/get_pharmacists', methods=['GET'])
def get_pharmacy():
    con = get_con()
    try:
        pharmacist = con.query("SELECT * FROM pharmacist ORDER BY first_name;")
        return jsonify(pharmacist)
    finally:
        con.close()

@app.route('/get_pharmacist_details', methods=['GET'])
def get_pharmacy_info():
    pharmacist_id = request.args.get('name').split()
    con = get_con()
    try:
        pharmacist_query ="CALL GetPharmacistDetails(%s,%s);"
        

        pharmacist_data = con.query(pharmacist_query, (pharmacist_id[0],pharmacist_id[1]))

        if not pharmacist_data:
            return jsonify({"error": "No data found for the selected pharmacist"}), 404

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
                "expiration_date": row["expiration_date"].strftime("%Y-%m-%d"),
            })
        return jsonify(result)

    except Exception as e:
        # Log the exception for debugging
        print("Error executing query:", e)
        return jsonify({"error": str(e)}), 500




    
@app.route('/user_setting')
def setting():
    return render_template('pharmacist_profile.html')

@app.route('/add_new', methods=['GET', 'POST'])
def add_new():
    if request.method == 'GET':
        con = get_con()
        try:
            certificates = con.query("SELECT name FROM certification")
            certificate_names = [cert['name'] for cert in certificates]
            return render_template('add_new.html', certificate_names=certificate_names)
        finally:
            con.close()
    elif request.method == 'POST':
        data = request.get_json()
        con = get_con()
        try:
            # Insert doctor information
            doctor_info = data
            insert_doctor_query = """
                INSERT INTO doctor (
                    first_name, last_name, office_name, office_address_street_name, office_address_street_num,
                    office_address_town, office_address_state, office_address_zipcode, email, phone, specialty
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """
            doctor_values = (
                doctor_info['first_name'],
                doctor_info['last_name'],
                doctor_info['office_name'],
                doctor_info['office_address_street_name'],
                doctor_info['office_address_street_num'],
                doctor_info['office_address_town'],
                doctor_info['office_address_state'],
                doctor_info['office_address_zipcode'],
                doctor_info['email'],
                doctor_info['phone'],
                doctor_info['specialty']
            )
            # Execute the insert into 'doctor' table
            con.execute(insert_doctor_query, doctor_values)

            # For each certification, insert into 'certification' and 'obtains_doctor' tables
            certifications = doctor_info.get('certifications', [])
            for cert in certifications:
                cert_name = cert['certification_name']
                institution = cert['institution']
                expiration_date = cert['expiration_date']
                # Check if certification exists
                select_cert_query = "SELECT * FROM certification WHERE name = %s"
                cert_result = con.query(select_cert_query, (cert_name,))
                if not cert_result:
                    # Insert into 'certification' table
                    insert_cert_query = """
                        INSERT INTO certification (name, institution,expiration_date)
                        VALUES (%s, %s, %s)
                    """
                    con.execute(insert_cert_query, (cert_name, institution, expiration_date))
                # Insert into 'obtains_doctor' table
                insert_obtains_query = """
                    INSERT INTO obtains_doctor (first_name, last_name, certification_name)
                    VALUES (%s, %s, %s)
                """
                obtains_values = (
                    doctor_info['first_name'],
                    doctor_info['last_name'],
                    cert_name,
                )
                con.execute(insert_obtains_query, obtains_values)
            # Commit the transaction
            con.commit()
            return jsonify({'success': True}), 200
        except Exception as e:
            # Handle the error, rollback the transaction
            con.rollback()
            print("Error inserting doctor:", e)
            return jsonify({'success': False, 'error': str(e)}), 500
        finally:
            con.close()


@app.route('/modify', methods=['POST', 'GET'])
def modify():
    if request.method == 'GET':
        con = get_con()
        try:
            customers = con.query("SELECT * FROM customer;")
            return render_template('modify.html', customers=customers)
        except Exception as e:
            con.rollback()
            return jsonify({'success': False, 'error': str(e)}), 500
        finally:
            con.close()

@app.route('/modify_pharm', methods=['POST'])
def modify_pharm():
    data = request.get_json()

    order_id = data.get('order_id')
    pharmacy_id = data.get('pharmacy_id')

    con = get_con()
    try:
        # Update the picks_up table for the given order_id
        con.execute("""
            UPDATE picks_up 
            SET pharmacy_id = %s 
            WHERE order_id = %s;
        """, (pharmacy_id, order_id))

        con.commit()

        return jsonify({'success': True})

    except Exception as e:
        con.rollback()
        return jsonify({'success': False, 'error': str(e)}), 500
    finally:
        con.close()



@app.route('/delete', methods =['POST','GET'])
def delete():
    if request.method == 'GET':
        con =get_con()
        try:
            customer = con.query(f"SELECT *from customer;")
            return render_template('delete.html', customers = customer)
        except Exception as e:
            con.rollback()
            return jsonify({'success': False, 'error': str(e)}), 500
        
        finally:
            con.close()
   
    # return render_template('delete.html')
@app.route('/delete_customer', methods=['POST'])
def delete_customer():
    data = request.get_json()
    first_name = data.get('first_name')
    last_name = data.get('last_name')
    con = get_con()
    try:
        # Delete the customer using first_name and last_name
        con.execute("""
            DELETE FROM customer
            WHERE first_name = %s AND last_name = %s;
        """, (first_name, last_name))
        con.commit()
        return jsonify({'success': True})
    except Exception as e:
        con.rollback()
        return jsonify({'success': False, 'error': str(e)}), 500
    finally:
        con.close()

@app.route('/get_pharmacies', methods=['GET'])
def get_pharmacies():
    con = get_con()
    try:
        pharmacies = con.query("SELECT pharmacy_id, name FROM pharmacy_store ORDER BY name;")
        return jsonify(pharmacies)
    finally:
        con.close()




if __name__ == '__main__':
    app.run()



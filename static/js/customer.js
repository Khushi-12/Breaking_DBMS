// static/js/customer.js

async function displayCustomers() {
    const tableName = "Customer"
    const displayArea = document.getElementById('display-area');
        try {
            const response = await fetch('/get_customers');
            if (!response.ok) throw new Error("Failed to fetch customer list");

            const customers = await response.json();

            // Build the dropdown dynamically with customer data
            const customerDropdown = `
                <label for="customerDropdown">Select a Customer:</label>
                <select id="customerDropdown" name="customerDropdown">
                    ${customers.map(customer => `<option value="${customer.first_name + " " + customer.last_name}">${customer.first_name + " " + customer.last_name}</option>`).join('')}
                </select>
            `;

            displayArea.innerHTML = `
                <h2>${tableName} Table</h2>
                <p>Details of the ${tableName} table will appear here.</p>
                ${customerDropdown}
                <div id="info-card" class="info-card hidden"></div>
            `;

            // Add event listener for dropdown change
            document.getElementById('customerDropdown').addEventListener('change', displayCustomerInfo);

        } catch (error) {
            console.error("Error fetching customer data:", error);
            displayArea.innerHTML = `
                <h2>${tableName} Table</h2>
                <p>Failed to load customer details.</p>
            `;
        }
    // Handle other table names if necessary
}

async function displayCustomerInfo(event) {
    const customerId = event.target.value;
    const infoCard = document.getElementById('info-card');

    if (customerId) {
        try {
            const response = await fetch(`/get_customer_info?id=${encodeURIComponent(customerId)}`);
            if (!response.ok) throw new Error("Failed to fetch customer info");

            const customerInfo = await response.json();

            infoCard.innerHTML = `
                <div class="tabs">
                    <button class="tab-button active" data-tab="tab1">Info</button>
                    <button class="tab-button" data-tab="tab2">Orders</button>
                </div>

                <div class="tab-content" id="tab1">
                    <h3>${customerInfo.first_name} ${customerInfo.last_name}</h3>
                    <p>DOB: ${customerInfo.dob}</p>
                    <p>Email: ${customerInfo.email}</p>
                    <p>Phone: ${customerInfo.phone}</p>
                    <p>Address: ${customerInfo.address_street_name} ${customerInfo.address_street_num}, ${customerInfo.address_town}, ${customerInfo.address_state}, ${customerInfo.address_zipcode}</p>
                    <p>Insurance #: ${customerInfo.insurance_id}</p>
                    <p>Insurance Name: ${customerInfo.insurance_name}</p>
                    <p>Insurance Contact: ${customerInfo.contact}</p>
                </div>

                <div class="tab-content hidden" id="tab2">
                    <div class="scroll-container">
                        ${customerInfo.orders.map(order => `
                            <div class="box">
                                <h3>Order #${order.order_id}</h3>
                                <p><strong>Delivery Date:</strong> ${order.delivery_date}</p>
                                <p><strong>Pickup Pharmacy Name:</strong> ${order.name}</p>
                                <p><strong>Prescribing Doctor:</strong> Dr. ${order.doctor_first_name}</p>
                                <div class="prescription-container">
                                    ${order.prescriptions.length > 0 ? order.prescriptions.map(prescription => `
                                        <div class="prescription-box">
                                            <h4>Prescription ${prescription.val}</h4>
                                            <p><strong>Brand Name:</strong> ${prescription.brand_name}</p>
                                            <p><strong>Name:</strong> ${prescription.scientific_name}</p>
                                            <p><strong>Quantity:</strong> ${prescription.quantity}</p>
                                            <p><strong>Dosage:</strong> ${prescription.dosage} mg</p>
                                            <p><strong>Expiration Date:</strong> ${prescription.expiration_date}</p>
                                        </div>
                                    `).join('') : `<p>No prescriptions for this order.</p>`}
                                </div>
                            </div>
                        `).join('')}
                    </div>
                </div>
            `;
            infoCard.classList.remove('hidden');

            // Initialize tabs
            setupTabs();

        } catch (error) {
            console.error("Error fetching customer info:", error);
            infoCard.innerHTML = "<p>Failed to load customer details.</p>";
            infoCard.classList.remove('hidden');
        }
    } else {
        infoCard.classList.add('hidden');
    }
}

// Automatically display customers when the page loads
document.addEventListener("DOMContentLoaded", () => {
    displayCustomers();
});
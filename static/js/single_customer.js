// static/js/single_customer.js

async function displayCustomerInfoByEmail(email) {
    const infoCard = document.getElementById('info-card');

    try {
        const response = await fetch(`/get_customer_info?email=${encodeURIComponent(email)}`);
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
}

// Automatically display customer information based on the logged-in user's email when the page loads
document.addEventListener("DOMContentLoaded", () => {
    const customerEmail = "{{ customer.email }}"; // Assuming the email is passed to the template from the server
    displayCustomerInfoByEmail(customerEmail);
});

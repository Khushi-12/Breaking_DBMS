// static/js/doctor.js

async function displayDoctors() {
    const tableName ="Doctor"
    const displayArea = document.getElementById('display-area');
        try {
            const response = await fetch('/get_doctors');
            if (!response.ok) throw new Error("Failed to fetch doctors list");

            const doctors = await response.json();

            // Build the dropdown dynamically with doctor data
            const doctorDropdown = `
                <label for="doctorDropdown">Select a Doctor:</label>
                <select id="doctorDropdown" name="doctorDropdown">
                    ${doctors.map(doctor => `<option value="${doctor.first_name + " " + doctor.last_name}">${doctor.first_name + " " + doctor.last_name}</option>`).join('')}
                </select>
            `;

            displayArea.innerHTML = `
                <h2>${tableName} Table</h2>
                <p>Details of the ${tableName} table will appear here.</p>
                ${doctorDropdown}
                <div id="info-card" class="info-card hidden"></div>
            `;

            document.getElementById('doctorDropdown').addEventListener('change', displayDoctorInfo);
        } catch (error) {
            console.error("Error fetching doctor data:", error);
            displayArea.innerHTML = `
                <h2>${tableName} Table</h2>
                <p>Failed to load doctor details.</p>
            `;
        }
}

async function displayDoctorInfo(event) {
    const doctorId = event.target.value;
    const infoCard = document.getElementById('info-card');

    if (doctorId) {
        try {
            const response = await fetch(`/get_doctor_info?id=${encodeURIComponent(doctorId)}`);
            if (!response.ok) throw new Error("Failed to fetch doctor info");

            const doctorInfo = await response.json();

            // Build the profile details
            const profile = `
                <h3>${doctorInfo.first_name} ${doctorInfo.last_name}</h3>
                <p>Email: ${doctorInfo.email}</p>
                <p>Phone: ${doctorInfo.phone}</p>
                <p>Office Name: ${doctorInfo.office_name}</p>
                <p>Office Address: ${doctorInfo.office_address_street_name} ${doctorInfo.office_address_street_num}, ${doctorInfo.office_address_town}, ${doctorInfo.office_address_state}, ${doctorInfo.office_address_zipcode}</p>
            `;

            // Build the certifications
            let certifications = `
                <h4>Certifications:</h4>
                <div class="certifications-container">
            `;
            if (doctorInfo.certifications && doctorInfo.certifications.length > 0) {
                certifications += doctorInfo.certifications.map(cert => `
                    <div class="certification-card">
                        <h3>${cert.certification_name}</h3>
                        <p><strong>Institution:</strong> ${cert.institution}</p>
                        <p><strong>Expiration Date:</strong> ${cert.expiration_date}</p>
                    </div>
                `).join('');
            } else {
                certifications += `<p>No certifications available.</p>`;
            }
            certifications += `</div>`;

            infoCard.innerHTML = profile + certifications;
            infoCard.classList.remove('hidden');
        } catch (error) {
            console.error("Error fetching doctor info:", error);
            infoCard.innerHTML = "<p>Failed to load doctor details.</p>";
            infoCard.classList.remove('hidden');
        }
    } else {
        infoCard.classList.add('hidden');
        infoCard.innerHTML = ""; // Clear the info card if no doctor is selected
    }
}

// Automatically display doctors when the page loads
document.addEventListener("DOMContentLoaded", () => {
    displayDoctors();
});
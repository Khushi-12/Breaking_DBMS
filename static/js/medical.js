// static/js/medwiki.js

async function displayMedWiki() {
    const tableName ="MediWiki"
    const displayArea = document.getElementById('display-area');

    
        try {
            const response = await fetch('/get_meds');
            if (!response.ok) throw new Error("Failed to fetch medications list");

            const meds = await response.json();

            // Build the dropdown dynamically with medication data
            const medDropdown = `
                <label for="medDropdown">Select a Medication:</label>
                <select id="medDropdown" name="medDropdown">
                    ${meds.map(med => `<option value="${med.common_name}">${med.common_name}</option>`).join('')}
                </select>
            `;

            displayArea.innerHTML = `
                <h2>${tableName} Table</h2>
                <p>Details of the ${tableName} table will appear here.</p>
                ${medDropdown}
                <div id="info-card" class="info-card hidden"></div>
            `;

            document.getElementById('medDropdown').addEventListener('change', displayMedInfo);
        } catch (error) {
            console.error("Error fetching med data:", error);
            displayArea.innerHTML = `
                <h2>${tableName} Table</h2>
                <p>Failed to load med details.</p>
            `;
        }
}

async function displayMedInfo(event) {
    const medId = event.target.value;
    const infoCard = document.getElementById('info-card');

    if (medId) {
        try {
            const response = await fetch(`/get_medication_info?id=${encodeURIComponent(medId)}`);
            if (!response.ok) throw new Error("Failed to fetch med info");

            const medInfo = await response.json();

            infoCard.innerHTML = `
                <h3>${medInfo.common_name}</h3>
                <p>Scientific Name: ${medInfo.scientific_name}</p>
                <p>Brand Name: ${medInfo.brand_name}</p>
                <p>Intake Type: ${medInfo.type}</p>
                <p>Manufacturer: ${medInfo.contact}</p>
                <p>Medicine Warning: ${medInfo.warnings}</p>
            `;

            infoCard.classList.remove('hidden');
        } catch (error) {
            console.error("Error fetching med info:", error);
            infoCard.innerHTML = "<p>Failed to load med details.</p>";
            infoCard.classList.remove('hidden');
        }
    } else {
        infoCard.classList.add('hidden');
    }
}

// Automatically display medications when the page loads
document.addEventListener("DOMContentLoaded", () => {
    displayMedWiki();
});
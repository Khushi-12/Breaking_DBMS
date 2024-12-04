// static/js/common.js

// Function to add dashes to phone numbers
function addDashesToPhoneNumber(number) {
    return number.slice(0, 3) + '-' + number.slice(3, 6) + '-' + number.slice(6);
}

// Function to display tabs
function setupTabs() {
    const tabs = document.querySelectorAll(".tab-button");
    const tabContents = document.querySelectorAll(".tab-content");

    tabs.forEach((tab) => {
        tab.addEventListener("click", () => {
            // Remove 'active' class from all tabs
            tabs.forEach((t) => t.classList.remove("active"));

            // Hide all tab contents
            tabContents.forEach((content) => content.classList.add("hidden"));

            // Add 'active' class to the clicked tab
            tab.classList.add("active");

            // Show the corresponding tab content
            const target = tab.dataset.tab;
            document.getElementById(target).classList.remove("hidden");
        });
    });
}

// Placeholder functions for top bar actions
function addNew() {
    alert('Add New functionality triggered');
}

function modify() {
    alert('Modify functionality triggered');
}

function deleteItem() {
    alert('Delete functionality triggered');
}
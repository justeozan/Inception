document.getElementById("contact-form").addEventListener("submit", function(event) {
	event.preventDefault(); // Prevent form submission

	// Get form values
	const name = document.getElementById("name").value;
	const email = document.getElementById("email").value;
	const message = document.getElementById("message").value;

	// Basic validation
	if (name === "" || email === "" || message === "") {
		alert("Please fill in all fields");
		return;
	}

	// Simulate form submission
	alert(`Thank you for your message, ${name}! We will get back to you at ${email}.`);

	// Reset form
	document.getElementById("contact-form").reset();
});

document.querySelectorAll(".card-appointment").forEach((task) => {
	task.addEventListener("click", (event) => {
		task.nextElementSibling.classList.toggle("hidden");
		task.querySelectorAll("i").forEach((icon) => {
			icon.classList.toggle("hidden");
		});
	});
});




document.querySelectorAll(".card-appointment-show-button").forEach((button) => {
	button.addEventListener("click", (event) => {
		button.querySelectorAll("i").forEach((icon) => {
			icon.classList.toggle("hidden");
		});
		document.querySelector(".header").innerHTML = "<h1>MAP GOES HERE<h1>";
	});
});
 

document.querySelectorAll(".card-appointment").forEach((task) => {
	task.addEventListener("click", (event) => {
		task.nextElementSibling.classList.toggle("hidden");
		task.querySelectorAll("i").forEach((icon) => {
			icon.classList.toggle("hidden");
		});
	});
});
 

console.log("hello");

document.querySelectorAll(".card-appointment").forEach((task) => {
	task.addEventListener("click", (event) => {
		task.nextElementSibling.classList.toggle("hidden");
	});
});
 

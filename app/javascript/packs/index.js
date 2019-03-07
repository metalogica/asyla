

document.querySelectorAll(".card-appointment").forEach((task) => {
	

	task.addEventListener("click", (event) => {
		$(task.nextElementSibling).slideToggle();
		task.querySelectorAll("i").forEach((icon) => {
			icon.classList.toggle("hidden");
		});
	});
});



// document.querySelectorAll(".card-appointment-show-button").forEach((button) => {
// 	button.addEventListener("click", (event) => {
// 		document.querySelector(".header").innerHTML = "<h1>MAP GOES HERE<h1>";
// 	});
// });
 

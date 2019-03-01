import swal from 'sweetalert';

const confirm_alerts = () => {
  swal("Good job!", "Appointment confirmed", "success");
  // .then((value) => {
  //   simpleFormCocktailName.value = value;
  //   setTimeout(500);
  //   simpleFormCocktailSubmit.click();
  // })
};

const button = document.querySelector('.attending');
  button.addEventListener("click", (event) => {
  confirm_alerts();
});

export { confirm_alerts };

console.log('hello')

import swal from 'sweetalert';

const conflictAlert = () => {
  swal("Oops", "Call your case manager", "warning");
};

const buttonConflict = document.querySelector('.conflict');


buttonConflict.addEventListener("click", (event) => {
  conflictAlert();
});

export { conflictAlert };


const confirmAlert = () => {
  swal("Good job!", "Appointment confirmed", "success");
};

const buttonConfirm = document.querySelector('.attending');


buttonConfirm.addEventListener("click", (event) => {
  confirmAlert();
});

export { confirmAlert };


const cancellationAlert = () => {
  swal("Are you sure?", "Confirm cancellation", "warning");
};

const buttonCancel = document.querySelector('.btn-danger');


buttonCancel.addEventListener("click", (event) => {
  cancellationAlert();
});

export { cancellationAlert };

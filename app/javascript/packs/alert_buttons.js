import swal from 'sweetalert';

const conflictAlert = () => {
 swal("Oops", "Call your case manager", "warning");
};

const buttonConflict = document.querySelectorAll('.conflict');

buttonConflict.forEach((button) => {
 button.addEventListener("click", (event) => {
 conflictAlert();
 })
});

export { conflictAlert };


const confirmAlert = () => {
 swal("Good job!", "Appointment confirmed", "success");
};

const buttonConfirm = document.querySelectorAll('.attending');



buttonConfirm.forEach((button) => {
 button.addEventListener("click", (event) => {
 confirmAlert();
 });
});

export { confirmAlert };


const cancellationAlert = () => {
 swal("Are you sure?", "Confirm cancellation", "warning");
};

const buttonCancel = document.querySelectorAll('.btn-danger');


buttonCancel.forEach((button) => {
    button.addEventListener("click", (event) => {
    cancellationAlert();
    });
});

export { cancellationAlert };

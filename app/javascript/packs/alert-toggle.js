export const alertToggle = () => {
  const alertIcon = document.getElementById('bell');
  const notificationBar = document.querySelector('.notifications-bar');
  alertIcon.addEventListener("click", (event) => {
    notificationBar.classList.toggle('hidden');
  });
}

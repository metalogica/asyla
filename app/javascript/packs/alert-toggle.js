export const alertToggle = () => {
  const alertIcon = document.getElementById('bell-fill');
  const notificationBar = document.querySelector('.notifications-bar');
  const notificationTitle = document.querySelector('.notifications-title');
  alertIcon.addEventListener("click", (event) => {
    notificationBar.classList.toggle('hidden');
    notificationTitle.classList.toggle('hidden');
  });
}

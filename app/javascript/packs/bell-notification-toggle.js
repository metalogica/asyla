export const bellToggle = () => {
  const bellFill = document.getElementById('bell-fill');
  const bellEmpty = document.querySelector('.bell');
  bellEmpty.addEventListener("click", (event) => {
    bellFill.classList.toggle('hidden');
  });
}

export const bellToggle = () => {
  const bellFill = document.getElementById('bell-fill');
  const bellEmpty = document.getElementById('bell');
  bellEmpty.addEventListener("click", (event) => {
    bellFill.classList.toggle('hidden');
    bellEmpty.classList.toggle('hidden')
  });
   bellFill.addEventListener("click", (event) => {
    bellFill.classList.toggle('hidden');
    bellEmpty.classList.toggle('hidden')
  });
}

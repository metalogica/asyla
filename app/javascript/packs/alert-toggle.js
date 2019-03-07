const alertToggle = () => {
  const notificationBar = document.querySelector('.notifications-bar');
  const notificationTitle = document.querySelector('.notifications-title');
    notificationBar.classList.toggle('hidden');
    notificationTitle.classList.toggle('hidden');
}

const bellToggle = () => {
  const bellFill = document.getElementById('bell-fill');
  const bellEmpty = document.getElementById('bell');
    bellFill.classList.toggle('hidden');
    bellEmpty.classList.toggle('hidden');
}

export const notifications = () => {
  if (document.getElementById('bell-fill')) {
    document.getElementById('bell-fill').addEventListener('click', function(){
      alertToggle();
      // bellToggle();
    });
    document.getElementById('bell').addEventListener('click', function(){
      bellToggle();
    });
  };
};

export const bellHover = () => {
  const bellFill = document.getElementById('bell-fill');
  const bellEmpty = document.getElementById('bell');

  if (bellEmpty) {
    bellEmpty.addEventListener("mouseenter", (event) => {
      bellFill.classList.toggle('hidden');
      bellEmpty.classList.toggle('hidden');
    });
  };

  if (bellFill) {
    bellFill.addEventListener('mouseleave', (event) => {
    bellFill.classList.toggle('hidden');
    bellEmpty.classList.toggle('hidden');
  });
  };
};

export const showMenu = () => {
  const navTrigger = document.querySelector(".nav-trigger");
  const body = document.querySelector("body");

  if (navTrigger) {
    navTrigger.addEventListener("click", toggleNavigation);

    function toggleNavigation(event) {
      event.preventDefault();
      body.classList.toggle("nav-open");
    }

    const overlay = document.querySelector(".overlay");
    overlay.addEventListener("click", () => {
      body.classList.remove("nav-open");
    });
  }
};


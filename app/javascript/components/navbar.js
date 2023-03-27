export const navbarScroll = () => {
  const navbar = document.querySelector("#navbar-large-screen");
  if (navbar) {
    const hideNavbar = () => {
      if (navbar.classList.contains("scroll-translate")) {
        return;
      }
      navbar.classList.add("scroll-translate");
    };

    const showNavbar = () => {
      if (navbar.classList.contains("scroll-translate")) {
        navbar.classList.remove("scroll-translate");
      }
    };

    let lastScrollTop = 0;

    function scrollDirection() {
      let state = window.pageYOffset || document.documentElement.scrollTop;
      if (state > lastScrollTop) {
        hideNavbar();
      } else {
        showNavbar();
      }
      lastScrollTop = state <= 0 ? 0 : state; // For Mobile or negative scrolling
    }

    window.addEventListener("scroll", scrollDirection, false);
  }
};

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

export const artistLinkClick = () => {
  const navTrigger = document.querySelector("#artist-link");

  if (navTrigger) {
    console.log('coucou');
    function toggleArtists(e) {
      e.preventDefault();
      const artistsLinks = document.querySelectorAll(".link-line-artist");
      artistsLinks.forEach(link => {
        link.classList.toggle('hidden')
      });
    }

    navTrigger.addEventListener("click", toggleArtists);
  }
};

export const lightbox = () => {
  const indexPicture = document.querySelector(".tattoo-card-image");
  if (indexPicture) {
    const lightboxImage = document.querySelectorAll(".lightbox-img");
    const previewBox = document.querySelector(".preview-box");
    const previewImg = previewBox.querySelector("img");
    const currentImg = previewBox.querySelector(".current-img");
    const totalImg = previewBox.querySelector(".total-img");
    const shadow = document.querySelector(".shadow");

    lightboxImage.forEach((image) => {
      image.addEventListener("click", () => {
        const imageURL = image.querySelector("img").src;
        const closeIcon = previewBox.querySelector(".details-icon");
        previewImg.src = imageURL;
        previewBox.classList.add("show");
        shadow.style.display = "block";

        function closePreviewBox() {
          previewBox.classList.remove("show");
          shadow.style.display = "none";
          document.querySelector("body").style.overflow = "scroll";
        }

        closeIcon.addEventListener("click", () => closePreviewBox());
        shadow.addEventListener("click", () => closePreviewBox());
      });
    });
  }
};

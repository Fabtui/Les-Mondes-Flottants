export const lightbox = () => {
  const indexPicture = document.querySelector(".tattoo-card-image");
  if (indexPicture) {
    const lightboxImages = document.querySelectorAll(".lightbox-img");
    const previewBox = document.querySelector(".preview-box");
    const previewImg = previewBox.querySelector("img");
    const nextButton = document.querySelector("#ligthbox-next");
    const prevButton = document.querySelector("#ligthbox-prev");
    const shadow = document.querySelector(".shadow");

    lightboxImages.forEach((image) => {
      image.addEventListener("click", () => {
        const imageURL = image.querySelector("img").src;
        const closeIcon = previewBox.querySelector(".details-icon");
        nextButton.style.display = 'block';
        prevButton.style.display = "block";
        previewImg.src = imageURL;
        previewImg.dataset.index = image.dataset.index;
        previewBox.classList.add("show");
        shadow.style.display = "block";

        function closePreviewBox() {
          previewBox.classList.remove("show");
          shadow.style.display = "none";
          nextButton.style.display = "none";
          prevButton.style.display = "none";
          document.querySelector("body").style.overflow = "scroll";
        }

        closeIcon.addEventListener("click", () => closePreviewBox());
        shadow.addEventListener("click", () => closePreviewBox());
      });
    });
  }
};

export const lightboxNavigation = () => {
  const indexPicture = document.querySelector(".tattoo-card-image");
  if (indexPicture) {
    const allImages = document.querySelectorAll(".lightbox-img img");
    const nextButton = document.querySelector("#ligthbox-next");
    const prevButton = document.querySelector("#ligthbox-prev");

    nextButton.addEventListener('click', () => {
      const currentImageIndex = parseInt(document.querySelector('.image-box img').dataset.index)
      const previewImg = document.querySelector(".preview-box img");
      if (currentImageIndex < allImages.length - 1) {
        previewImg.src = allImages[currentImageIndex + 1].src;
        previewImg.dataset.index = currentImageIndex + 1;
      } else {
        previewImg.src = allImages[0].src;
        previewImg.dataset.index = 0;
      }
    })

    prevButton.addEventListener("click", () => {
      const currentImageIndex = parseInt(document.querySelector(".image-box img").dataset.index);
      const previewImg = document.querySelector(".preview-box img");
      if (currentImageIndex === 0) {
        previewImg.src = allImages[allImages.length - 1].src;
        previewImg.dataset.index = allImages.length - 1;
      } else {
        previewImg.src = allImages[currentImageIndex - 1].src;
        previewImg.dataset.index = currentImageIndex - 1;
      }
    });
  }
};

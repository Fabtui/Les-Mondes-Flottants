export const lightboxTattoos = () => {
  const indexPicture = document.querySelector(".lightbox-img");
  if (indexPicture) {
    const lightboxTattooImages = document.querySelectorAll(".lightbox-img");
    const previewBox = document.querySelector(".preview-box");
    const previewImg = previewBox.querySelector("img");
    const nextButton = document.querySelector("#ligthbox-next");
    const prevButton = document.querySelector("#ligthbox-prev");
    const shadow = document.querySelector(".shadow");

    lightboxTattooImages.forEach((image) => {
      image.addEventListener("click", () => {
        const imageURL = image.querySelector("img").src;
        const closeIcon = previewBox.querySelector(".details-icon");
        nextButton.style.display = 'block';
        prevButton.style.display = "block";
        previewImg.src = imageURL;
        previewImg.dataset.index = image.dataset.index;
        previewImg.dataset.class = image.dataset.class;
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

export const lightboxTattooNavigation = () => {
  const indexPicture = document.querySelector(".lightbox-img");
  if (indexPicture) {
    const nextButton = document.querySelector("#ligthbox-next");
    const prevButton = document.querySelector("#ligthbox-prev");

    nextButton.addEventListener('click', () => {
      const currentImage = document.querySelector(".image-box img");
      const currentImageIndex = parseInt(currentImage.dataset.index)
      const previewImg = document.querySelector(".preview-box img");
      let allImages = []
      if (currentImage.dataset.class === "Tattoo") {
        allImages = document.querySelectorAll(".lightbox-tattoo-img img");
      } else {
        allImages = document.querySelectorAll(".lightbox-flash-img img");
      }
      if (currentImageIndex < allImages.length - 1) {
        previewImg.src = allImages[currentImageIndex + 1].src;
        previewImg.dataset.index = currentImageIndex + 1;
      } else {
        previewImg.src = allImages[0].src;
        previewImg.dataset.index = 0;
      }
    })

    prevButton.addEventListener("click", () => {
      const currentImage = document.querySelector(".image-box img");
      const currentImageIndex = parseInt(currentImage.dataset.index);
      const previewImg = document.querySelector(".preview-box img");
      let allImages = [];
      if (currentImage.dataset.class === "Tattoo") {
        allImages = document.querySelectorAll(".lightbox-tattoo-img img");
      } else {
        allImages = document.querySelectorAll(".lightbox-flash-img img");
      }
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

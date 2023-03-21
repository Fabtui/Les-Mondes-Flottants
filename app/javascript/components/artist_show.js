import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js";
import { foundAvailableHours } from "./services";

export const artistAppointmentFlatpikr = () => {
  const appointmentContainer = document.querySelector(".appointment_date");

  if (appointmentContainer) {
    const data = document.querySelector(".appointment-form").dataset;
    // const bookedDate = data.bookedDate.split('$')
    flatpickr("#appointment_date", {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      locale: French,
      // theme: "dark",
      minDate: "today",
      minuteIncrement: 60,
      minTime: data.startTime,
      maxTime: data.endTime,
      disable: [
        // ...bookedDate,
        function (date) {
          // return true to disable -> disable saturday (6) and sunday (0)
          return date.getDay() === 0 || date.getDay() === 6;
        },
      ],

      // disable: [
      //   function (date) {
      //     // disable every multiple of 8
      //     return !(date.getDate() % 8);
      //   },
      // ],
    });
  }
}

export const rdvButtonClick = () => {
  const rdvButton = document.querySelector("#rdv-button");

  if (rdvButton) {
    const formDIv = document.querySelector(".appointment-shadow");

    rdvButton.addEventListener('click', () => {
      formDIv.classList.toggle('hidden')
    })

    const formCloseButton = document.querySelector('#form-close-button')
    formCloseButton.addEventListener("click", () => {
      console.log("click");
      formDIv.classList.toggle("hidden");
      formDIv.classList.toggle("form-anim");
    });
  }
};

export const flatpickrDays = () => {
  const dateInput = document.querySelector("#appointment_date");
  if (dateInput) {

    const data = document.querySelector(".appointment-form").dataset;
    const startTime = data.startTime
    const endTime = data.endTime;
    const bookedDates = data.bookedDate.split('$').map((day) => day.replace("_", " ").replace("_UTC", "").split(' '))

    dateInput.addEventListener("change", () => {
      const inputDate = dateInput.value.split(' ')[0];
      const bookedHours = bookedDates.filter(date => date[0] == inputDate ).map(date => date[1])

      const flatpickrCalendar = document.querySelector(".flatpickr-calendar");

      const availableHours = foundAvailableHours(
        startTime,
        endTime,
        bookedHours
      );

      // create container for avaible hours if not already created
      const hoursContainer = document.querySelector(".form-hours-container");
      if (hoursContainer) {
        hoursContainer.innerHTML = `${availableHours.map((hour) => `<p>${hour}</p>`).join('')}`;
      } else {
        const hoursContainer = document.createElement("div");
        hoursContainer.classList.add("form-hours-container");
        flatpickrCalendar.appendChild(hoursContainer)
        hoursContainer.innerHTML = `${availableHours.map((hour) => `<p>${hour}</p>`).join('')}`;
      }

      const hours = document.querySelectorAll(".form-hours-container p");
      hours.forEach((hour) => {
        hour.addEventListener("click", () => {
          console.log(hour.innerText);
          const selectedhour = hour.innerText.split(':')
          const flatpikrHour = document.querySelector(".flatpickr-hour");
          const flatpikrMinute = document.querySelector(".flatpickr-minute");
          flatpikrHour.value = selectedhour[0];
          flatpikrMinute.value = selectedhour[1];
          const flatpikrInput = document.querySelector(".flatpickr-input");
          flatpikrInput.value = `${flatpikrInput.value.split(" ")[0]} ${hour.innerText}`;
        });
      });

    });

  }

}

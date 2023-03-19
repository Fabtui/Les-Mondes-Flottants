import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js";

export const artistAppointmentFlatpikr = () => {
  const appointmentContainer = document.querySelector(".appointment_date");

  if (appointmentContainer) {
    flatpickr("#appointment_date", {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      locale: French,
      theme: "dark",
      minDate: "today",
      minTime: "16:00",
      maxTime: "22:00",
      // disable: [
      //   function (date) {
      //     // disable every multiple of 8
      //     return !(date.getDate() % 8);
      //   },
      // ],
    });
  }
}

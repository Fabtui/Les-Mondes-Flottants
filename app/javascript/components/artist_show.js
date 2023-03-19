import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js";

export const artistAppointmentFlatpikr = () => {
  const appointmentContainer = document.querySelector(".appointment_date");

  if (appointmentContainer) {
    const data = document.querySelector(".appoinement-container").dataset;
    const bookedDate = data.bookedDate.split('$')
    flatpickr("#appointment_date", {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      locale: French,
      theme: "dark",
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

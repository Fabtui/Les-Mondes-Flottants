export const foundAvailableHours = (startTime, endTime, bookedHours) => {
  // startTime & endTime string 'xx:00'
  const start = parseInt(startTime.split(":")[0]);
  const end = parseInt(endTime.split(":")[0]);

  let hours = [];
  for (let i = start; i < end; i++) {
    hours.push(`${i}h00`);
    hours.push(`${i}h30`);
  }
  hours.push(endTime);

  const bookedHoursMutated = bookedHours.map((hour) => hour.slice(0, -3));
  const availableHours = hours.filter(
    (hour) => !bookedHoursMutated.includes(hour)
  );
  return availableHours;
};

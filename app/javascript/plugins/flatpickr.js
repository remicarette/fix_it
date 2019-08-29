import flatpickr from "flatpickr";
import "flatpickr/dist/themes/material_green.css"; // Note this is important!

flatpickr(".datepicker", {
  dateFormat: "d/m/Y",

  "disable": [
    function(date) {
        // return true to disable
        return (date.getDay() === 0 || date.getDay() === 6);

    }
  ],
    "locale": {
      "firstDayOfWeek": 1 // start week on Monday
    }
})

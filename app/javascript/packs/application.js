import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import "./sign_up";
import "./avatar";
import { initMapbox } from '../plugins/init_mapbox';
import "./players"
import "./search_duration"
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.css';
import { French } from "flatpickr/dist/l10n/fr.js"

import choices from "choices.js";
import "choices.js/public/assets/styles/choices.css";


initMapbox();
flatpickr('.date-calendar', { locale: French });
flatpickr('.time-calendar', {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    locale: French,
    time_24hr: true
});

const elements = document.querySelectorAll('.choices');
elements.forEach((element) => {
  new choices(element);
});

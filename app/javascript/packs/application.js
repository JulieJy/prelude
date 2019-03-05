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
import choices from "choices.js";
import "choices.js/public/assets/styles/choices.css";


initMapbox();
flatpickr('.date-calendar', {disableMobile: true});
flatpickr('.time-calendar', {
    disableMobile: true,
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
});

new choices('.choices');

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

initMapbox();
flatpickr('.date-calendar', {disableMobile: true});
flatpickr('.time-calendar', {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
});

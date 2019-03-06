import {alertToggle} from './alert-toggle';
alertToggle();
import 'bootstrap';
import './alert-buttons';
import './index.js'
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import {bellToggle} from './bell-notification-toggle';
initMapbox();



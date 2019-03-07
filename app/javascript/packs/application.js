import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();
import {notifications} from './alert-toggle';
notifications();
import {bellHover} from './alert-toggle';
bellHover();
import 'bootstrap';
import './alert-buttons';
import './index.js'



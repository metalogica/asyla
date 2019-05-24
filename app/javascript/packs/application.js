import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import {notifications} from './alert-toggle';
import {bellHover} from './alert-toggle';
import 'bootstrap';
import './alert-buttons';
import './index.js'

initMapbox();
notifications();
bellHover();



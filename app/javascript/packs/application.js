import "bootstrap";
import "../plugins/flatpickr";
import { getChatbox } from '../components/refreshPage';
import { updateStars } from '../components/stars';
import 'select2/dist/css/select2.css';
import { initSelect2 } from '../components/init_select2';


updateStars();
getChatbox();
initSelect2();

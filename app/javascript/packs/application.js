import "bootstrap";
import "../plugins/flatpickr";
import { getChatbox } from '../components/refreshPage';
import { updateStars } from '../components/stars';

updateStars();
getChatbox();

import { displayReviews } from '../components/display_all_reviews'
displayReviews();

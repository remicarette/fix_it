import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
  selectOnClose: true })
};

export { initSelect2 };

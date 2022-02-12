import places from 'places.js';
import $ from 'jquery';

const initAutocomplete = () => {
  const addressInput = document.querySelector('.camper_autocomplete');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };

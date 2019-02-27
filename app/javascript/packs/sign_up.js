const farmerTrue = document.querySelector('#event_place_bar');
const farmerMore = document.querySelector('.dropdown_address');
const farmerFalse = document.querySelector('#event_place_chez_moi');

if (farmerTrue) {
  farmerTrue.addEventListener('change', () => {
    farmerMore.style.display = 'block';
  });
}

if (farmerFalse) {
  farmerFalse.addEventListener('change', () => {
    farmerMore.style.display = 'none';
  });
}

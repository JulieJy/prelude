const farmerTrue = document.querySelector('#event_place_bar');
const farmerMore = document.querySelector('.dropdown_address');
const farmerFalse = document.querySelector('#event_place_chez_moi');
const formLogin = document.querySelector('.form-login');
const buttonEmail = document.querySelector('#btn-email');

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


if (buttonEmail) {
  buttonEmail.addEventListener('click', (event) => {
    event.preventDefault();
    formLogin.classList.toggle('show');
  });
}


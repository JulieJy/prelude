const nb = document.querySelector('#nb_player');

const btnminus = document.querySelector('#btnminus');

if (btnminus) {
  btnminus.addEventListener('click', (event) => {
    event.preventDefault();
    let oldValue = Number.parseInt(nb.value);
    if (nb.value <= 2) {
      nb.value = 2;
    } else {
      nb.value = oldValue - 1;
    }
  });
}

const btnplus = document.querySelector('#btnplus');

if (btnplus) {
  btnplus.addEventListener('click', (event) => {
    event.preventDefault();
    let oldValue = Number.parseInt(nb.value);
    if (nb.value >= 8) {
      nb.value = 8;
    } else {
      nb.value = oldValue + 1;
    }
  });
}

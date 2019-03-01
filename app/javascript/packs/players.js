const nb = document.querySelector('#nb_player');

const btnminus = document.querySelector('#glyphicon-minus');

if (btnminus) {
  btnminus.addEventListener('click', (event) => {
    event.preventDefault();
    let oldValue = Number.parseInt(nb.value);
    nb.value = oldValue - 1;
  });
}

const btnplus = document.querySelector('#glyphicon-plus');

if (btnplus) {
  btnplus.addEventListener('click', (event) => {
    event.preventDefault();
    let oldValue = Number.parseInt(nb.value);
    nb.value = oldValue + 1;
  });
}

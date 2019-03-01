//= require rails-ujs
//= require_tree .
const nb = document.querySelector('#nb_player');

const btnminus = document.querySelector('#glyphicon-minus');
btnminus.addEventListener('click', (event) => {
  event.preventDefault();
  let oldValue = Number.parseInt(nb.value);
  console.log(oldValue--);
  nb.value = oldValue--;
});

const btnplus = document.querySelector('#glyphicon-plus');
btnplus.addEventListener('click', (event) => {
  event.preventDefault();
  let oldValue = Number.parseInt(nb.value)
  console.log(oldValue++);
  nb.value = oldValue++;
});

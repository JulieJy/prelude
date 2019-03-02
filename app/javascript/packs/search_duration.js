const durationBoxes = document.querySelectorAll('.duration-box');

if (durationBoxes) {
  durationBoxes.forEach((box) => {
    box.addEventListener('click', (event) => {
    box.classList.toggle("active");
    });
  });
}

const categoryBoxes = document.querySelectorAll('.category-box');

if (categoryBoxes) {
  categoryBoxes.forEach((box) => {
    box.addEventListener('click', (event) => {
    box.classList.toggle("active");
    });
  });
}

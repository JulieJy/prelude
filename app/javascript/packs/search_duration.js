const boxes = document.querySelectorAll('.duration-box');

if (boxes) {
  boxes.forEach((box) => {
    box.addEventListener('click', (event) => {
    box.classList.toggle("active");
    });
  });
}

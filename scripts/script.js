const form = document.querySelector('#search-form');
const input = document.querySelector('#search-input');
const items = document.querySelectorAll('.categorias li');

form.addEventListener('submit', (e) => {
  e.preventDefault();
  const term = input.value.trim().toLowerCase();

  items.forEach((item) => {
    if (item.textContent.toLowerCase().indexOf(term) > -1) {
      item.style.display = '';
    } else {
      item.style.display = 'none';
    }
  });

  input.value = '';
});

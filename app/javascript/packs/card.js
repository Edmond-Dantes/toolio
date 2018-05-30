
// const cards = Q

const element = document.querySelector('.card');
element.addEventListener('click',(event) => {
  const card = event.currentTarget;
  card.classList.add('card-onclick-animation')
});


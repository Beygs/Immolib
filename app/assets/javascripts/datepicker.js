const element = document.getElementById('pickadate');
const hiddenInput = document.getElementById('start_date');

const initialState = {
  selected: new Date(),
  template: 'DD MMMM YYYY - HH:mm'
}

const picker = pickadate.create(initialState, pickadate.translations.fr_FR);

pickadate.render(element, picker);

const parseDate = date => {
  let oldDate = date.split(' ');
  const months = [
    'Janvier',
    'Février',
    'Mars',
    'Avril',
    'Mai',
    'Juin',
    'Juillet',
    'Août',
    'Septembre',
    'Octobre',
    'Novembre',
    'Décembre'
  ]

  oldDate[1] = months.findIndex(e => e === oldDate[1]) + 1;

  return `${oldDate[2]}-${oldDate[1]}-${oldDate[0]}T${oldDate[4]}:00+01:00`;
}

const onChange = e => {
  e.preventDefault();
  element.value = picker.getValue();
  hiddenInput.value = parseDate(picker.getValue());
}

element.addEventListener('pickadate:change', onChange);
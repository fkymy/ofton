$(function() {
  feather.replace({
    class: '',
    'stroke-width': 2,
    stroke: '#657786',
    width: 22,
    height: 22
  })
});

$('.headerMain__toggle').on('click', function() {
  var linksElement = document.querySelector('.headerMain__links');
  var navElement = document.querySelector('.headerNav');

  if (linksElement.style.display == 'block') {
    linksElement.style.display = 'none';
    navElement.style.display = 'block';
  } else {
    navElement.style.display = 'none';
    linksElement.style.display = 'block';
  }
});

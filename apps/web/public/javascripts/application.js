$(document).ready(function( ) {
  $('[data-image-url]').each(function( i, el ) {
    el       = $(el);
    var card = el.find('.mdl-card__media');
    card.css({"background-image": "url('" + el.data('image-url') + "')" });
  });
});

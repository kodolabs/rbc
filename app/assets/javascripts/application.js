//= require jquery
//= require jquery_ujs
//= require bootstrap


$(document).on('ready', function() {
  $('#open-forms').on('click', function(e) {
    e.preventDefault();
    $('#new_user').slideDown('slow');
  });
});

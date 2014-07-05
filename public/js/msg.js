$(document).ready(function() {
  $('.login').on('click', function(event) {
    event.preventDefault();
    $('.login-form-modal').fadeToggle(400);
  })
});

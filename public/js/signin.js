$(document).ready(function() {
  var msg = $('msg')
  $('.login').on('click', function(event) {
    event.preventDefault();
    $('.login-form-modal').fadeToggle(400);
  })

  $('.signup').on('click', function(event) {
    event.preventDefault();
    $('.signup-form-modal').fadeToggle(400);
  })

  $('.login-form').on('submit', function(event) {
    console.log('hey-o')
    event.preventDefault();
    $('.signup-form-modal').fadeToggle(200);
    msg.fadeToggle(200);
  })
});

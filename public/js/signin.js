$(document).ready(function() {
  var msg = $('msg');
  $('.login').on('click', function(event) {
    event.preventDefault();
    $('.login-form-modal').fadeToggle(400);
  })

  $('.signup').on('click', function(event) {
    event.preventDefault();
    $('.signup-form-modal').fadeToggle(400);
  })

  $('.login-form').on('submit', function(event) {
    console.log('hey-o');
    event.preventDefault();
    $('.login-form-modal').fadeToggle();
    $.ajax({
      url: '/login',
      method: 'POST',
      type: 'json',
      data: {
        user: {
          email: $('.user-email').val(),
          name: $('.user-name').val(),
          password: $('.user-password').val()
        }
      },
      success: function(data) {
        console.log('success func')
      },
      error: function(data) {
        console.log('error func');
        console.log(data['responseText']);
        $('.message').text(data['responseText']);
        $('.message-modal').fadeToggle(200).delay(3000).fadeToggle(800);
      }
    });
    // $('.signup-form-modal').fadeToggle(400);
    // $('.signup-form-modal').fadeToggle(200);
    // msg.fadeToggle(200);
  });
});

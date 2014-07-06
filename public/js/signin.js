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
          password: $('.user-password').val()
        }
      },
      success: function(data) {
        console.log('success func');
        window.location.href = "http://localhost:9292/" + data;
      },
      error: function(data) {
        // $('.login-form .user-email').val('');
        // $('.login-form .user-password').val('');
        console.log('error func');
        console.log(data['responseText']);
        $('.message').text(data['responseText']);
        $('.message-modal').fadeToggle( 200).delay(3000).fadeToggle(800);
        $('.signup-form-modal').delay(3000).fadeToggle(400);
      }
    });
  });

  $('.signup-form').on('submit', function(event) {
    event.preventDefault();
    $('.signup-form-modal').fadeToggle();
    $.ajax({
      url: "/signup",
      method: 'POST',
      data: 'json',
      data: {
        user: {
          email: $('.signup-form .user-email').val(),
          name: $('.signup-form .user-name').val(),
          password: $('.signup-form .user-password').val()
        }
      },
      success: function(data){
        console.log("success");
      },
      error: function(data) {
        console.log(data['responseText']);
        alert(data['responseText']);
      }
    });
  });

  $('.close').on('click', function() {
    $('.modal').hide(400);
  });

});




























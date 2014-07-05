$(document).ready(function() {
var counter = 1

  $("#start_survey").on('click', function(event) {
    event.preventDefault;
    $("#start_survey").hide();
    $('#question_1').show();
  });

  $("#next_question").on('click', function(event) {
    event.preventDefault;
    $('#question_' + counter).hide();
    counter += 1;
    $('#question_' + counter).show();
  });

  $('#the_submit').on('submit', function(event) {
    event.preventDefault();
    console.log('Email being verified...');
    newEmail = $('#email').val();
    console.log(newEmail);
    ajaxRequest = $.ajax({
      url: "/signup",
      method: 'POST',
      dataType: 'application/json',
      data: {
        user: {
          email: newEmail 
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

});

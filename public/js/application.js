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

  // $('#posts').on('submit', function(event) {
  //   console.log('User created...');
  //   event.preventDefault();
  //   postTitle = $('#new-title').val();
  //   console.log(postTitle);
  //   ajaxRequest = $.ajax({
  //     url: "/signup",
  //     type: 'POST',
  //     data: {
  //       error: message
  //     },
  //     success: function(data) {
  //       $('.post-container').append(data['post']);
  //       flashMessage(data['responseText']);
  //     },
  //     error: function(data) {
  //       console.log(data);
  //       flashMessage(data['responseText']);
  //     }
  //   })
  // })

});

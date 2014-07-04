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

});

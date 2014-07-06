$(document).ready(function() {
    var counter = 1
    var num = 1

    // $("#start_survey").on('click', function(event) {
    //     event.preventDefault;
    //     $("#start_survey").hide();
    //     $('#question_1').show();
    // });

    // $("#next_question").on('click', function(event) {
    //     console.log(counter)
    //     event.preventDefault;
    //     $('#question_' + counter).hide();
    //     counter += 1;
    //     $('#question_' + counter).show();
    //     console.log(counter)
    // });

    $("#create_survey").on('click', function(event) {
        event.preventDefault;
        $("#create_survey").hide();
        $("#title").hide();
        $("#new_question").show();
        $("#question_" + num).show();
        for (i = 0; i <= 4; i++) {
          $("#choice_" + num + i).show();
        };
    });

    $("#new_question").on('click', function(event) {
        event.preventDefault;

        if(num > 2){
          $("#new_question").hide();
          $("#finish_survey").show();
        };

        $("#question_" + num).hide();
        for (i = 0; i <= 4; i++) {
            $("#choice_" + num + i).hide();
        };

        num += 1;

        $("#question_" + num).show();
        for (i = 0; i <= 4; i++) {
            $("#choice_" + num + i).show();
        };
    });

    $('#eagle').flyOffPage();


});

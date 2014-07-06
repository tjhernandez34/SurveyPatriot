$(document).ready(function() {

	var questionHTML, choiceHTML, choiceCount;
	var questionCount = 0;

	$('.create-survey-section').on('click', '#add-question', function(){
		questionCount++;
		choiceCount = 0;
		questionHTML = '<article class="question-container"><ul class="question-end"><li><input id="question' + questionCount + '" class="form-field" name="questions[question_' + questionCount + '][question]" type="text" placeholder="ask a question"></li><li><span class="btn btn-primary add-choice">add a choice</span><span class="btn btn-secondary rm-question">remove this question</span></li></ul></article>';
		$('.survey-end').before(questionHTML);
		$('#question' + questionCount).focus();
	});

	$('.create-survey-section').on('click', '.add-choice', function(){
		choiceCount++;
		choiceHTML = '<input class="input_choices" id="choice_' + questionCount + choiceCount + '"><input id="choice' + questionCount + choiceCount + '" class="form-field" name="choice_' + questionCount + choiceCount + '" type="text" placeholder="add possible choice">';
		$(this).parent().append(choiceHTML);
		$('#choice' + questionCount + choiceCount).focus();
	});


	$('.create-survey-section').on('click', '.rm-question', function(){
		$(this).parent().remove();
	});
});
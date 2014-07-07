$(document).ready(function() {

	var questionHTML, choiceHTML;
	var choiceCount = 1;
	var questionCount = 1;

	$('.create-survey-section').on('click', '#add-question', function(){
		questionCount++;
		choiceCount = 0;
		questionHTML = '<article class="question-container hidden"><input id="question' + questionCount + '" class="form-field" name="questions[question_' + questionCount + '][question]" type="text" placeholder="ask a question"><ul class="question-end"><li><span class="btn btn-primary add-choice">add a choice</span></li><li><span class="btn btn-secondary rm-question">remove this question</span></li></ul></article>';
		$('.message').text('question successfully added');
		$('.message-modal').fadeToggle().delay(600).fadeToggle(1000);
		$('.question-container').last().hide().after(questionHTML);
		$('.question-container').last().fadeToggle(600);
		$('#question' + questionCount).focus();
	});

	$('.create-survey-section').on('click', '.add-choice', function(){
		choiceCount++;
		choiceHTML = '<input class="form-field choice" id="choice' + questionCount + choiceCount + '" name="choice_' + questionCount + choiceCount + '" type="text" placeholder="add possible choice">';
		$('.question-end').before(choiceHTML);
		$('#choice' + questionCount + choiceCount).focus();
	});


	$('.create-survey-section').on('click', '.rm-question', function(){
		$(this).parent().parent().parent().remove();
	});
});
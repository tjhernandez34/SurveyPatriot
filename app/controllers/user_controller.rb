before '/users/*' do
  @user = User.find(params[:user_id])
  redirect '/' unless @user.logged_in?(session)
  @choices = Choice.all
  @questions = @survey.questions
end

get '/users/:user_id' do
  erb :profile
end

get '/users/:user_id/surveys' do
  @surveys = Survey.find_by_user_id(params[:user_id])

  erb :user_surveys
end

post '/users/:user_id/surveys/create' do
  @survey = Survey.create(params[:survey])
  questions = []
  params[:questions].each { |q| questions << Question.create(q) }
  @survey.load(questions, params)
  redirect to "/surveys/#{@survey.id}"
end

get '/users/:user_id/surveys/:survey_id/confirm' do
  @survey = Survey.find(params[:survey_id])
  erb :survey
end

post '/users/:user_id/surveys/:survey_id/edit' do
  @survey = Survey.find(params[:survey_id])
  @survey.update(title: params[:title])

  num = 1
  counter = 1
  @questions.each do |question|

    question.update(question: params["question#{num}".to_sym])
      @choices.select { |choice| choice.question_id == question.id}.each do |choice|
        choice.update(choice: params["choice#{counter}".to_sym])
          counter += 1
      end
    num += 1
  end
  redirect to "/surveys/#{@survey.id}"
end

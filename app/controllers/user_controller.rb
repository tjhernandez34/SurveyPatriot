before '/users/*' do
  @user = User.find(params[:user_id])
  redirect '/' unless @user.logged_in?(session)
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

  questions = [ question1=Question.create(params[:question1]),
                question2=Question.create(params[:question2]),
                question3=Question.create(params[:question3]) ]

  @survey.load(questions, params)

  redirect to "/surveys/#{@survey.id}"
end


get '/users/:user_id/surveys/:survey_id/confirm' do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  @choices = Choice.all

  erb :survey
end

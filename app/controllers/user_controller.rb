before '/users/:user_id/*' do
  @user = User.find(params[:user_id])
  redirect '/' unless @user.logged_in?(session)
  @choices = Choice.all
end

get '/users/:user_id' do
  @user = User.find(params[:user_id])
  redirect '/' unless @user.logged_in?(session)
  erb :"users/profile"
end

get '/users/:user_id/surveys' do
  @surveys = @user.surveys
  erb :"users/surveys"
end

get '/users/:user_id/surveys/create' do
  @counter = 1
  erb :"surveys/_create_survey_form"
end

post '/users/:user_id/surveys/create' do
  survey = Survey.create(title: params[:survey][:title], user_id: params[:user_id])
  questions = []
  params[:questions].each { |q| questions << Question.create(q[1]) }
  survey.load(questions, params)
  redirect to "/surveys/#{survey.id}"
end

# get '/users/:user_id/surveys/:survey_id/confirm' do
#   @survey = Survey.find(params[:survey_id])
#   erb :"surveys/survey"
# end

# =================TEST========================
post '/users/:user_id/surveys/:survey_id/edit' do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  @survey.edit(params)
  redirect to "/surveys/#{@survey.id}"
end

get '/users/:user_id/surveys/:survey_id/results' do
  @survey = Survey.find(params[:survey_id])
  # @choices = @survey.data

  erb :"surveys/results"
end

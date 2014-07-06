before '/surveys' do
  @choices = Choice.all
  @surveys = Survey.all
end

before '/surveys/*' do
  @choices = Choice.all
  @surveys = Survey.all
end

get '/surveys' do
  erb :"surveys/surveys"
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  session[:round_id] = Round.create(user_id: session[:id], survey_id: params[:survey_id]).id
  @survey_length = @survey.questions.length
  @questions = @survey.questions

  erb :"surveys/survey"
end

post '/surveys/:survey_id' do
  p params
  @round = Round.find(session[:round_id])
  params[:answer].each_value do |choice_id|
    @choice = Choice.find(choice_id)
    @round.choices << @choice
  end
  @round.save!
  redirect to "/users/#{session[:id]}"
end


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
  erb :"surveys/survey"
end

post '/surveys/:survey_id' do
  @round = Round.find(session[:round_id])
  @choice = Choice.find(params[:answer])
  @round.choices << @choice
  @round.save!
  halt 200
end

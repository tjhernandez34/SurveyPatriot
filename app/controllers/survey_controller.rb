before '/surveys' do
  @choices = Choice.all
  @surveys = Survey.all
end

before '/surveys/*' do
  @choices = Choice.all
  @surveys = Survey.all
end

get '/surveys' do
  erb :surveys
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])

  erb :single_survey
end

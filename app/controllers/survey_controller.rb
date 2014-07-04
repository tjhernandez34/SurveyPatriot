before '/surveys' do
  # cehck if logged in, or else redirect home
end

get '/surveys' do
  @surveys = Survey.all
  erb :surveys
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])

  erb :single_survey
end

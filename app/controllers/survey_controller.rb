get '/surveys' do
  @surveys = Survey.all
  erb :surveys
end

post '/surveys/create' do
  # survey = Survey.create
  # # question1=Question.create
end













# params
# { survey: {
#   title: survey[title],
#   question1: {

#   }
#   }
# }

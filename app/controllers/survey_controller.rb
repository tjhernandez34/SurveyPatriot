before '/surveys' do
  # cehck if logged in, or else redirect home
end

get '/surveys' do
  @surveys = Survey.all
  erb :surveys
end

post '/surveys/create' do
  @survey = Survey.create(params[:survey])

  question1=Question.create(params[:question1])
  question2=Question.create(params[:question2])
  question3=Question.create(params[:question3])

  [question1, question2, question3].each do |q|
    (1..3).each do |num|
      q.choices << Choice.create({
        question_id: q.id,
        choice: params["choice#{num}".to_sym]
        })
      @survey.questions << q
    end
  end

  redirect to "/surveys/#{@survey.id}"
end

get '/surveys/:survey_id/confirm' do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  @choices = Choice.all

  erb :survey
end

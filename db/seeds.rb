

# 30.times do
#   User.create({
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     password_hash: 'foo'
#     })
# end

6.times do
  survey = Survey.create({
    title: Faker::Company.catch_phrase,
    user_id: 1
    })
  2.times do
    question = Question.create({
      question: Faker::Commerce.product_name + "?"
    })
    4.times do
      choice = Choice.create({
        choice: Faker::Company.bs + "!",
        question_id: question.id
      })
    end
    survey.questions << question
  end
end

# User.all.each do |user|
#   Round.create({
#     user_id: user.id,
#     survey_id: rand(1..6)
#     })
# end

8.times do
  choices = Choice.all
  round = Round.create(survey_id: 1, user_id: rand(1..30))
  Survey.find(1).questions.each do |question|
    round.choices << choices.select { |choice| choice.question_id == question.id }.sample
  end
end

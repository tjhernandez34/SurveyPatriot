3.times do
  User.create({
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password_hash: 'foo'
    })
end

6.times do
  survey = Survey.create({
    title: Faker::Company.catch_phrase,
    user_id: rand(1..3)
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

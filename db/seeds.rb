

# # 30.times do
# #   User.create({
# #     name: Faker::Name.name,
# #     email: Faker::Internet.email,
# #     password_hash: 'foo'
# #     })
# # end

# 6.times do
#   survey = Survey.create({
#     title: Faker::Company.catch_phrase,
#     user_id: 1
#     })
#   4.times do
#     question = Question.create({
#       question: Faker::Commerce.product_name + "?"
#     })
#     4.times do
#       choice = Choice.create({
#         choice: Faker::Company.bs + "!",
#         question_id: question.id
#       })
#     end
#     survey.questions << question
#   end
# end

# # User.all.each do |user|
# #   Round.create({
# #     user_id: user.id,
# #     survey_id: rand(1..6)
# #     })
# # end

# 8.times do
#   choices = Choice.all
#   round = Round.create(survey_id: 1, user_id: rand(1..30))
#   Survey.find(1).questions.each do |question|
#     round.choices << choices.select { |choice| choice.question_id == question.id }.sample
#   end
# end

america = Survey.create(title: "America, F%#k Yeah!", user_id: 1)

question1 = Question.create(question: "What is more American?")
america.questions << question1
Choice.create(choice: "Apple Pie", question_id: question1.id)
Choice.create(choice: "Baseball", question_id: question1.id)
Choice.create(choice: "Freedom", question_id: question1.id)
Choice.create(choice: "War", question_id: question1.id)




question2 = Question.create(question: "Who was the greatest President?")
america.questions << question2
Choice.create(choice: "Abraham Lincoln", question_id: question2.id)
Choice.create(choice: "George Washington", question_id: question2.id)
Choice.create(choice: "Theodore Roosevelt", question_id: question2.id)
Choice.create(choice: "All of them are great, they're American.", question_id: question2.id)

question3 = Question.create(question: "What is your favorite song?")
america.questions << question3
Choice.create(choice: "The Star-Spangled Banner", question_id: question3.id)
Choice.create(choice: "The Star-Spangled Banner", question_id: question3.id)
Choice.create(choice: "The Star-Spangled Banner", question_id: question3.id)
Choice.create(choice: "The Star-Spangled Banner", question_id: question3.id)


question4 = Question.create(question: "Is America a great country or the greatest country?")
america.questions << question4
Choice.create(choice: "Greatest", question_id: question4.id)











3.times do
  User.create({
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password_hash: 'foo'
    })
end

6.times do
  Survey.create({
    title: Faker::Company.catch_phrase,
    user_id: rand(1..3)
    })
end

12.times do
  Question.create({
    question: Faker::Commerce.product_name + "?"
    })
end

(1..12).each do |id_num|
  2.times do
    Choice.create({
      choice: Faker::Company.bs + "!",
      question_id: id_num
      })
  end
end

User.all.each do |user|
  Round.create({
    user_id: user.id,
    survey_id: rand(1..6)
    })
end

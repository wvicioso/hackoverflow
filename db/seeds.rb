require 'faker'
include Faker
User.create(username: 'Me', email: 'me@iam.me', password: 'password', moderator: true)
User.create(username: 'matt', email: 'matt@matt.matt', password: 'matt', moderator: true)

ans = Answer.create(user_id: 1, question_id: 1, answer: "this answer")

ques = Question.create(user_id: 1, title: 'what is ruby?', question: "no really, what is it?", views: 1, best_answer_id: 1)

Comment.create(user_id: 1, commentable: ans, comment: "this comment")
Comment.create(user_id: 1, commentable: ques, comment: "this comment")

10.times do |i|
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.free_email,
    password: 'password'
  )
end

10.times do |i|
  # best answer id for some of the questions, otherwise nil

  rand(0..5) > 2 ? b_a = rand(1..10) : b_a = nil
  q_body = Faker::Hacker.say_something_smart + ' ' + Faker::Hacker.say_something_smart + " " + Faker::Hacker.say_something_smart

  Question.create(
    user_id: rand(1..10),
    best_answer_id: b_a,
    title: Faker::ChuckNorris.fact,
    question: q_body
  )
end

50.times do |i|
  Answer.create(
    user_id: rand(1..10),
    question_id: rand(1..10),
    answer: Faker::Hacker.say_something_smart
  )
end

500.times do |i|
  rand(0..2) > 0 ? vote = true : vote = false
  rand(0..1) == 1 ? type = Question : type = Answer
  Vote.create(
    user_id: rand(1..10),
    up_down: vote,
    votable_type: type,
    votable_id: rand(1..10)
  )
end

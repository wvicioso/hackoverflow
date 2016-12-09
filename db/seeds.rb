require 'faker'
include Faker
User.create(username: 'wvicioso', email: 'me@iam.me', password: 'password', moderator: true)
User.create(username: 'roman', email: 'rom@man.roman', password: 'roman', moderator: true)

ans = Answer.create(user_id: 1, question_id: 1, body: "this answer")

ques = Question.create(user_id: 1, title: 'what is ruby?', body: "no really, what is it?", views: 1, best_answer_id: 1)

Comment.create(user_id: 1, commentable: ans, body: "this comment for answer")
Comment.create(user_id: 1, commentable: ques, body: "this comment for question")

30.times do |i|
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
    body: q_body
  )

  5.times do |j|
    Answer.create(
    user_id: j+1,
    question_id: rand(1..10),
    body: Faker::Hacker.say_something_smart
    )
    30.times do |k|
      rand(0..2) > 0 ? vote = true : vote = false
      # rand(0..1) == 1 ? type = Question : type = Answer
      Vote.create(
      user_id: k+1,
      up_down: vote,
      votable_type: 'Answer',
      votable_id: Answer.last.id
      )
    end

    rand(0..3).times do |k|
      Comment.create(
      user_id: k+1,
      body: Faker::Hipster.sentence,
      commentable_type: 'Answer',
      commentable_id: Answer.last.id
      )
    end
  end

  30.times do |k|
    rand(0..2) > 0 ? vote = true : vote = false
    # rand(0..1) == 1 ? type = Question : type = Answer
    Vote.create(
    user_id: k+1,
    up_down: vote,
    votable_type: 'Question',
    votable_id: i
    )
  end

  rand(0..3).times do |k|
    Comment.create(
    user_id: k+1,
    body: Faker::Hipster.sentence,
    commentable_type: 'Question',
    commentable_id: Question.last.id
    )
  end
end

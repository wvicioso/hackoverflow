User.create(username: 'Me', email: 'me@iam.me', password: 'password', moderator: true)
User.create(username: 'matt', email: 'matt@matt.matt', password_digest: 'matt', moderator: true)

ans = Answer.create(user_id: 1, question_id: 1, answer: "this answer")

ques = Question.create(user_id: 1, title: 'what is ruby?', question: "no really, what is it?", views: 1, best_answer_id: 1)

Comment.create(user_id: 1, commentable: ans, comment: "this comment")
Comment.create(user_id: 1, commentable: ques, comment: "this comment")

Vote.create(user_id: 1, votable: ans, up_down: true)
Vote.create(user_id: 1, votable: ques, up_down: true)

User.create(username: 'Me', email: 'me@iam.me', password_digest: 'password', moderator: true)

Comment.create(user_id: 1, commenttable_id: 1, commenttable_type:"answer", comment: "this comment")
Comment.create(user_id: 1, commenttable_id: 1, commenttable_type:"question", comment: "this comment")

Vote.create(user_id: 1, votable_id: 1, votable_type:"answer", up_down: true)
Vote.create(user_id: 1, votable_id: 1, votable_type:"question", up_down: true)


Answer.create(user_id: 1, question_id: 1, answer: "this answer")

Question.create(user_id: 1, title: 'what is ruby?', question: "no really, what is it?", views: 1, best_answer_id: 1)

User.create(username: 'Me', email: 'me@iam.me', password: 'password', moderator: true)

<<<<<<< HEAD
ans = Answer.create(user_id: 1, question_id: 1, answer: "this answer")
=======
User.create(username: 'matt', email: 'matt@matt.matt', password_digest: 'matt', moderator: true)


Comment.create(user_id: 1, commenttable_id: 1, commenttable_type:"answer", comment: "this comment")
Comment.create(user_id: 1, commenttable_id: 1, commenttable_type:"question", comment: "this comment")
>>>>>>> answers

ques = Question.create(user_id: 1, title: 'what is ruby?', question: "no really, what is it?", views: 1, best_answer_id: 1)

Comment.create(user_id: 1, commentable: ans, comment: "this comment")
Comment.create(user_id: 1, commentable: ques, comment: "this comment")

<<<<<<< HEAD
Vote.create(user_id: 1, votable: ans, up_down: true)
Vote.create(user_id: 1, votable: ques, up_down: true)
=======
Answer.create(user_id: 1, question_id: 1, answer: "this answer")

Question.create(user_id: 2, title: 'what is ruby?', question: "no really, what is it?", views: 1, best_answer_id: 1)
>>>>>>> answers

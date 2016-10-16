def vote_num(question)
  question.votes.where(up_down: true).length - question.votes.where(up_down: false).length
end

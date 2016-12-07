def vote_num(question)
  puts '====================================================='
  p question
  puts '====================================================='
  question.votes.where(up_down: true).length - question.votes.where(up_down: false).length
end

def top_voted
  Question.all.sort { |q1, q2| vote_num(q2) <=> vote_num(q1) }
end

def vote_num(question)
  question.votes.where(up_down: true).length - question.votes.where(up_down: false).length
end

def top_voted
  Question.all.sort { |q1, q2| vote_num(q2) <=> vote_num(q1) }[0,5]
end

def search(search_params)
  questions = []
  if search_params[:title] != ''
    questions = Question.all.select { |q| q.title.downcase.include?(search_params[:title].downcase) }
    questions = questions.select { |q| q.body.downcase.include?(search_params[:body].downcase) }
  elsif search_params[:body] != ''
    questions = Question.all.select { |q| q.body.downcase.include?(search_params[:body].downcase) }
  end
  questions
end

post '/questions/:id' do
  new_answer = Answer.new(params[:answer])
  new_answer.update_attributes(user_id: session[:id])
  if new_answer.save
    redirect "/questions/#{params[:id]}"
  else
    'error'
  end
end

delete '/questions/:question_id/answers/:id' do
	@question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])

  if current_user == @answer.user
    @answer.destroy
  end

  redirect "/questions/#{params[:question_id]}"
end
#
#
get '/questions/:question_id/answers/:id/edit' do

  @question = Question.find(params[:question_id])
  @answers = @question.answers
  @answer = @answers.find(params[:id])

  erb :'answers/edit', layout: false, locals: {question: @question, answer: @answer}

end


put '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  @answer.update_attributes(answer: params[:new][:answer])
  content_type :json
  {text: @answer.body}.to_json
end

post '/answers/:answer_id/votes' do

  #if a user is logged in(only logged in users can vote)
  if current_user
    #find question
    answer = Answer.find_by(id: params[:answer_id])
    #decide if vote is up or down
    params[:up_down] == 'up' ? user_vote = true : user_vote = false
    #question.voted? is a method that determines if a user has voted on particular question
    if voted(current_user_id, answer)
      # if a vote exists, find in
      vote = Vote.where(votable: answer, user_id: current_user_id)[0]
      # update attribute with the newest vote
      vote.update_attribute(:up_down, user_vote)
    else
      #otherwise create a new vote
      new_vote = Vote.create(user_id: current_user_id, votable: answer, up_down: user_vote)
    end
  end

  content_type :json
  {vote_num: vote_num(answer), vote_class: voted(current_user_id, answer)}.to_json
end

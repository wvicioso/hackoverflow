# get '/questions/:question_id/votes' do
#   @question = Question.find(params[:question_id])
#
#   content_type :json
#   {vote_num: @vote_num}.to_json
# end


post '/questions/:question_id/votes' do

  if session[:id]
    question = Question.find_by(id: params[:question_id])
    user = User.find_by(id: session[:id])
    params[:up_down] == 'up' ? user_vote = true : user_vote = false
    if question.voted?(user.id)
      vote = Vote.where(votable_type: "Question", votable_id: question.id, user_id: user.id)[0]
      vote.update_attribute(:up_down, user_vote)
    else
      new_vote = Vote.new(user_id: user.id, votable: question, up_down: user_vote)
      if new_vote.save
        vote_num(question)
      end
    end
  end

  content_type :json
  {vote_num: vote_num(question), question_id: question.id}.to_json
end

put '/questions/:question_id/votes/:id' do
  @question = Question.find(params[:question_id])
  @vote = @question.votes.find(params[:id])
  if @vote.update_attributes(params[:vote])
    redirect "/questions/#{@question.id}/votes"
  else
    erb :'votes/edit' #show edit votes view again(potentially displaying errors)
  end
end

delete '/questions/:question_id/votes/:id' do
  @question = Question.find(params[:question_id])
  @vote = @question.votes.find(params[:id])
  @vote.destroy
  redirect "/questions/#{@question.id}/votes"
end

# get '/questions/:question_id/votes' do
#   @question = Question.find(params[:question_id])
#
#   content_type :json
#   {vote_num: @vote_num}.to_json
# end


post '/questions/:question_id/votes' do

  #if a user is logged in(only logged in users can vote)
  if current_user
    #find question
    question = Question.find_by(id: params[:question_id])
    #decide if vote is up or down
    params[:up_down] == 'up' ? user_vote = true : user_vote = false
    #question.voted? is a method that determines if a user has voted on particular question
    if question.voted?(current_user_id)
      # if a vote exists, find in
      vote = Vote.where(votable_type: "Question", votable_id: question.id, user_id: current_user_id)[0]
      # update attribute with the newest vote
      vote.update_attribute(:up_down, user_vote)
    else
      #otherwise create a new vote
      new_vote = Vote.create(user_id: current_user_id, votable: question, up_down: user_vote)
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

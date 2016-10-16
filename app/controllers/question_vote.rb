# get '/questions/:question_id/votes' do
#   @question = Question.find(params[:question_id])
#
#   content_type :json
#   {vote_num: @vote_num}.to_json
# end


post '/questions/:question_id/votes' do
  question = Question.find(params[:question_id])
  user = User.find(session[:id])
  #
  new_vote = Vote.new(user_id: user.id, votable: question, up_down: true)
  if new_vote.save && request.xhr?
    vote_num(question)

    content_type :json
    {vote_num: vote_num(question), question_id: question.id}.to_json
  end
end

# get '/questions/:question_id/votes/:id' do
#   @question = Question.find(params[:question_id])
#   @vote = @question.votes.find(params[:id])
#   erb :'votes/show'
# end
#
# get '/questions/:question_id/votes/:id/edit' do
#   @question = Question.find(params[:question_id])
#   @vote = @question.votes.find(params[:id])
#   erb :'votes/edit'
# end


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

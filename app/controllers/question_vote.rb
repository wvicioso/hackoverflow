get '/questions/:question_id/votes' do

  @question = Question.find(params[:question_id])

  @votes = @question.votes

  erb :'votes/index'

end

get '/questions/:question_id/votes/new' do

  @question = Question.find(params[:question_id])

  erb :'votes/new'

end

post '/questions/:question_id/votes' do
  @question = Question.find(params[:question_id])
  @vote = @question.votes.new(params[:vote])
  if @vote.save
    redirect "/questions/#{@question.id}/votes"
  else
    erb :'votes/new' #show new votes view again(potentially displaying errors)
  end
end

get '/questions/:question_id/votes/:id' do
  @question = Question.find(params[:question_id])
  @vote = @question.votes.find(params[:id])
  erb :'votes/show'
end

get '/questions/:question_id/votes/:id/edit' do
  @question = Question.find(params[:question_id])
  @vote = @question.votes.find(params[:id])
  erb :'votes/edit'
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

get '/answers/:answer_id/comments' do
  @answer = Answer.find(params[:answer_id])
  @comments = @answer.comments
  erb :'comments/index'
end

get '/answers/:answer_id/comments/new' do
  @answer = Answer.find(params[:answer_id])
  erb :'comments/new'
end

post '/answers/:answer_id/comments' do
  Comment.new(params[:new])
  redirect answer_show
end

get '/answers/:answer_id/comments/:id' do
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.find(params[:id])
end

get 	'/answers/:answer_id/comments/:id/edit' do
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.find(params[:id])

  erb:'comments/edit'
end

put '/answers/:answer_id/comments/:id' do
  @answer = Answer.find(params[:answer_id])
  @comment = @answer.comments.find(params[:id])
  if @comment.update_attributes(params[:comment])
    redirect answer_show
  else
    erb :'comments/edit' #show edit comments view again(potentially displaying errors)
  end
end

delete '/answers/:answer_id/comments/:id' do
  @answer = Answer.find(params[:answer_id])
  @comment = @answer.comments.find(params[:id])
  @comment.destroy
  redirect question_show
end

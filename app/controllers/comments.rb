get '/answers/:answer_id/comments' do
  @answer = Answer.find(params[:answer_id])
  @comments = @answer.comments
  erb :'comments/index'
end

get '/answers/:answer_id/comments/new' do
  @answer = Answer.find(params[:answer_id])
  erb :'comments/new'
end

# /answers/<%= answer.id %>/comments

post '/answers/:id/comments' do
  ans = Answer.find(params[:id])
  new_comment = Comment.create(user_id: current_user.id, comment: params[:comment], commentable: ans)
  content_type :json
  {comment: new_comment.body, user: new_comment.user.username, date: new_comment.created_at.strftime("%b-%d-20%y")}.to_json
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

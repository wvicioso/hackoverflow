get '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @comments = @question.comments
  erb :'comments/index'
end



get '/questions/:question_id/comments/new' do
  @question = Question.find(params[:question_id])
  erb :'comments/new'
end

post '/questions/:question_id/comments' do
  Comment.new(params[:new])
  redirect question_show
end

get 	'/questions/:question_id/comments/:id' do
  @question = Question.find(params[:question_id])
  @comment = Comment.find(params[:id])
end

get 	'/questions/:question_id/comments/:id/edit' do
  @question = Question.find(params[:question_id])
  @comment = Comment.find(params[:id])

  erb:'comments/edit'
end

put '/questions/:question_id/comments/:id' do
  @question = Question.find(params[:question_id])
  @comment = @question.comments.find(params[:id])
  if @comment.update_attributes(params[:comment])
    redirect question_show
  else
    erb :'comments/edit' #show edit comments view again(potentially displaying errors)
  end
end



delete '/questions/:question_id/comments/:id' do
  @question = Question.find(params[:question_id])
  @comment = @question.comments.find(params[:id])
  @comment.destroy
  redirect question_show
end

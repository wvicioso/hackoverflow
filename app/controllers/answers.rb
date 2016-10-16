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

  if session[:id] == @answer.user.id
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
  {text: @answer.answer}.to_json
end

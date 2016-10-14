# delete '/questions/:question_id/answers/:id' do
#   current_answer = Answer.find(params[:id])
#   current_question = current_answer.question.id

#   if session[:id] == current_answer.user.id 
#     current_answer.destroy
#   end

#   redirect "/questions/#{current_question}"
# end


delete '/questions/:question_id/answers/:id' do 

  @question = Question.find(params[:question_id])

  @answer = @question.answers.find(params[:id])

  @answer.destroy

  redirect "/questions/params[:question_id]"

end




post '/questions/:id' do
  new_answer = Answer.new(params[:answer])
    new_answer.update_attributes(user_id: session[:id])
  if new_answer.save
    redirect "/questions/#{params[:id]}"
  else
    'error'
  end
end


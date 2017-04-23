get '/questions' do
  @questions = Question.order(created_at: :desc)

  erb :'/questions/index'
end

get '/questions/search' do
  erb :'/questions/search'
end

get '/questions/search-by' do
  @questions = search(params)
  if @questions.empty?
    @errors = ["Sorry no results"]
    erb :'/questions/search'
  else
    erb :'/questions/index'
  end
end

get '/questions/new' do
  if current_user
    erb :'questions/new'
  else
    erb :index
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @question.update_attribute(:views, @question.views + 1)
  erb :'/questions/show'
end

post '/questions' do
  new_question = Question.new(params[:question])
  new_question.update_attributes(user_id: session[:id])
  if new_question.save
    redirect "/questions/#{new_question.id}"
  else
    redirect '/'
  end
end

post '/questions/:question_id/answers' do
  new_answer = Answer.new(params[:answer])
  if new_answer.save
    redirect :"/questions/#{params[:answer][:question_id]}"
  else
    render "Oooops, something went worng"
  end
end

delete '/questions/:id' do
  current_question = Question.find(params[:id])
  current_question.destroy
  redirect '/'
end


get '/questions/:id/edit' do
  @question = Question.find(params[:id])

  if session[:id] == @question.user_id
    erb :'/questions/edit'
  else
    redirect '/questions'
  end
end

put '/questions/:id' do
  current_question = Question.find(params[:id])

  if current_user == current_question.user
    current_question.update_attributes(params[:question])
  end
  redirect "/questions/#{current_question.id}"
end

post '/questions/:question_id/votes' do

  #if a user is logged in(only logged in users can vote)
  if current_user
    #find question
    question = Question.find_by(id: params[:question_id])
    #decide if vote is up or down
    params[:up_down] == 'up' ? user_vote = true : user_vote = false
    #question.voted? is a method that determines if a user has voted on particular question
    if voted(current_user_id, question)
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
  {vote_num: vote_num(question), question_id: question.id, vote_class: voted(current_user_id, question)}.to_json
end

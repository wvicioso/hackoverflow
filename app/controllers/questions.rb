get '/questions' do
  @questions = Question.all

  erb :'/questions/index'
end

get '/questions/search' do
  erb :'/questions/search'
end

get '/questions/search-by' do
  @questions = Question.all.select { |q| q.body.include?(params[:keyword]) }

  if @questions.empty?
    @errors = ["Sorry no results"]
  end
  erb :'/questions/index'
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
  if session[:id] == current_question.user_id
    current_question.update_attributes(params[:question])
  end
  redirect "/questions/#{current_question.id}"
end

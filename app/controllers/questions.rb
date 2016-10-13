get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  erb :'/questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions/new' do
  new_question = Question.new(params[:question])
  if new_question.save
    redirect "/questions/#{new_question.id}"
  else
    'error'
  end
end

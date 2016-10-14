enable :sessions


get '/users' do
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:new])
  if user.save
  session[:id] = user.id
  redirect "/users/#{user.id}"
  else
    'error'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

get 'users/:id' do
  sessions.reset

  erb :'sessions/logout'
end

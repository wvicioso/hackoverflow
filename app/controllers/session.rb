get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.find_by(username: params[:user][:username])
  if user.authenticate(params[:user][:password])
    session[:id] = user.id
    redirect "/questions"
  else
    "error"
  end
end

get '/sessions/logout' do
  session.clear
  erb :'sessions/logout'
end

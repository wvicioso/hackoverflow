get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.find_by(username: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:id] = user.id
    erb :'/users/_logged_in', layout: false
  else
    error = errors.full_messages 
    erb :'/users/_logged_in', layout: false
  end
end

get '/sessions/logout' do
  session.clear
  erb :'/users/_new', layout: false
end

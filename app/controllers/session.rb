get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  user = User.find_by(username: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:id] = user.id
    if request.xhr?
      erb :'/users/_logged_in', layout: false
    else
      redirect '/questions'
    end
  else
    if !(user)
      @errors = ["looks like username #{params[:user][:username]} doesn't exist"]
    else
      @errors = ["looks like you entered the wrong password"]
    end
    erb :'/sessions/new'
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/questions'
end

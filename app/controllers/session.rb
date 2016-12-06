get '/sessions/new' do
  if request.xhr?
    erb :'/sessions/_new', layout: false
  else
    erb :'/sessions/_new'
  end
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
      @sign_in_errors = ["looks like username #{params[:user][:username]} doesn't exist"]
    else
      @sign_in_errors = ["looks like you entered the wrong password"]
    end
    erb :'/users/_new', layout: false
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/questions'
end

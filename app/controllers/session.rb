get '/sessions/new' do
  if request.xhr?
    erb :'/users/_new', layout: false
  end
end

post '/sessions' do
  user = User.find_by(username: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:id] = user.id
    if request.xhr?
      erb :'/users/_logged_in', layout: false
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
  erb :'/users/_new', layout: false
end

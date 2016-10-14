get '/' do
  if session[:id]
    redirect "/users/#{session[:id]}"
  else
    erb :index
  end
end

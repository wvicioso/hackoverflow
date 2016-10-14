get '/' do
  puts current_user
  if current_user
    redirect "/users/#{session[:id]}"
  else
    redirect "/questions"
  end
end

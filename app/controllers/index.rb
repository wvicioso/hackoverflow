get '/' do
  # if current_user
  #   redirect "/users/#{session[:id]}"
  # else
  #   redirect "/questions"
  # end
  redirect "/questions"
end

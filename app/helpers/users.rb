def user_params(params)
  {username: params[:user][:username],password: params[:user][:password],email: params[:user][:email]}
end

def find_username(username)
  User.all.select {|user| user.username.downcase == username.downcase }[0] || false
end

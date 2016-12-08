def current_user
  return User.find_by(id: session[:id])
end

def current_user_id
  current_user.id if current_user
end

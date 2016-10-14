def current_user
  return User.find_by(id: session[:id])
end

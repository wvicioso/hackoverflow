def current_user
  return User.find_by(id: session[:id])
end

def current_user_id
  current_user.id if current_user
end

#return false if user hasn't voted, or the direction of user vote if they have.
def voted(user_id, votable)
  vote = Vote.where(user_id: user_id, votable: votable)[0]
  return false unless vote

  vote.up_down ? 'voted_up' : 'voted_down'
end

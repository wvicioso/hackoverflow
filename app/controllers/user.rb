enable :sessions


get '/users' do
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:new])
  if user.save
    session[:id] = user.id
    redirect "/users/#{user.id}"
  else
    'error'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

get '/users/:id/edit' do
@user_id = params[:id]
  erb :'users/edit'
end

put '/users/:id' do
  current_user.update_attributes(params[new])
  if current_user.save
    redirect "/users/#{current_user.id}"
  else
    'error'
  end
end


delete '/users/:id' do
  User.find(params[:id]).destroy
  redirect '/sessions/logout'
end

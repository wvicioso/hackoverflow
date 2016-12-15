get '/' do
  @questions = top_voted
  erb :'index'
end

#login form
get '/login' do
  @user = User.new
  erb :'users/login'
end

#create new session
post '/login' do
  user = User.where(email: params[:email]).first
  if user && user.password == params[:password]
    login(user)
    redirect "/users/#{user.id}"
  else
    @failed = true
    status 406
    erb :'users/login'
  end
end

#logout a user
get '/logout' do
  logout!
  redirect '/'
end
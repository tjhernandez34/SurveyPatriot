before '/*' do
  @logged_in = session[:id]
end

get '/' do
  erb :index
end

post '/login' do
  p params[:user][:email]
  @user = User.find_by_email(params['user']['email'])
  unless @user
    halt 400, 'looks like you need to create an account'
  end
  # redirect '/signup' unless @user
  @user.password == params[:user][:password]
  session[:id] = @user.id
  p "/users/#{@user.id}"
  halt 200, "/users/#{@user.id}"
end

post '/signup' do
  if User.find_by(email: params[:user][:email])
    p params[:user][:email]
    halt 400, "dude, you already have an account"
  else
    p params
    @user = User.create(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
    p @user
    session[:id] = @user.id
    halt 200, "/users/#{@user.id}"
 end
end

get '/signup' do
  erb :"users/signup"
end

get '/logout' do
  session.destroy
  redirect '/'
end

get '/' do
  erb :index
end

post '/login' do
  @user = User.find_by_email(params[:email])
  redirect '/signup' unless @user

  @user.password == params[:password]
  session[:id] = @user.id
  redirect "/users/#{@user.id}"
end

post '/signup' do
  @user = User.create(params[:user])
  session[:id] = @user.id
  redirect "/users/#{@user.id}"
end

get '/signup' do
  erb :"users/signup"
end

get '/logout' do
  session.destroy
  redirect '/'
end

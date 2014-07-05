get '/' do
  erb :index
end

post '/login' do
  @user = User.find_by_email(params[:user][:email])
  redirect '/signup' unless @user
  @user.password == params[:user][:password]
  session[:id] = @user.id
  redirect "/users/#{@user.id}"
end

post '/signup' do
  if User.find_by(email: params[:user][:email])
    p params[:user][:email]
    content_type 'application/json'
    halt 200, {message: "Email already exists"}.to_json
  else
    @user = User.create(params[:user])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
 end
end

get '/signup' do
  erb :"users/signup"
end

get '/logout' do
  session.destroy
  redirect '/'
end

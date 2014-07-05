get '/' do
  erb :index
end

post '/login' do
  @user = User.find_by("email = ?", params[:email])
  redirect '/signup' unless @user

  @user.password == params[:password]
  session[:id] = @user.id
  redirect "/users/#{@user.id}"
end

post '/signup' do
  @user = User.new(name: params[:name], email: params[:email])
  @user.password = params[:password]
  @user.save!
  session[:id] = @user.id
  redirect "/users/#{@user.id}"
end

get '/signup' do
  erb :signup
end

get '/logout' do
  session.destroy
  redirect '/'
end

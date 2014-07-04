get '/' do
  erb :index
end

post '/' do
  @user = User.find_by("email = ?", params[:email])
  if @user.password == params[:password]
    session[:id] = @user.id
    redirect to "/user/#{@user.id}"
  else
    redirect to '/register'
  end
end

post '/register' do
  @user = User.new(name: params[:name], email: params[:email])
  @user.password = params[:password]
  @user.save!
  redirect to "/user/#{@user.id}"
end

get '/register' do
  erb :register
end

post '/logout' do
  session[:id] = nil
  redirect to '/'
end

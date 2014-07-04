get '/user/:id' do
  @user = User.find(params[:id])
  erb :profile
end

get '/user/:user_id/surveys/create' do
  @user = User.find(params[:user_id])

  erb :UNKNOWN
end

get '/user/:user_id/surveys' do
  @user = User.find(params[:user_id])
  @surveys = Survey.find_by_user_id(params[:user_id])

  erb :UNKNOWN
end


post '' do
end

post '' do
end

post '' do
end

post '' do
end

get '/match/all' do
  @user = User.find(session[:user_id])
  @matches = User.where(location: @user.location).select { |match| match.stds.first.name == @user.stds.first.name }
  erb :'match/all'
end

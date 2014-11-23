get '/match/all' do
  @user = User.find(session[:user_id])
  @matches = User.where("location = ? AND id != ?", @user.location, @user.id).select { |match| match.stds == @user.stds }
  erb :'match/all'
end

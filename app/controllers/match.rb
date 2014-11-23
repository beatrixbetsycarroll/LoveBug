get '/match/all' do
  protected!
  @user = User.find(session[:user_id])
  @matches = User.where("location = ? AND id != ?", @user.location, @user.id).select { |match| match.stds.name == @user.stds.name }
  erb :'match/all'
end

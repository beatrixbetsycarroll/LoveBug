get '/match/all' do
  protected!
  @user = User.find(session[:user_id])
  @matches = User.where("location = ? AND id != ?", @user.location, @user.id).select { |match| match.stds.name == @user.stds.name && match.looking_for == @user.gender && @user.looking_for == match.gender}
  erb :'match/all'
end

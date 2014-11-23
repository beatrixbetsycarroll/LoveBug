get '/user/new' do
  erb :'/user/new'
end

post '/user' do
  @user = User.new(params[:user])
  @user.stds << Std.find(params[:std])
    if @user.save
      session[:user_id] = @user.id
      redirect("/user/#{@user.id}")
    else
      session[:errors] = @user.errors.messages
      redirect("/user/new")
    end
end

get '/user/login' do
  redirect("/") if session[:user_id]
  erb :'/user/login'
end

get '/user/logout' do
  session[:user_id] = nil
  redirect('/')
end

post '/user/login' do
  user = User.find_by(user_name: params[:user][:user_name]).try(:authenticate, params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect("user/#{user.id}")
  else
    session[:errors] = "non-existent user"
    redirect('/')
  end
end

get '/user/:id' do |id|
  protected!
  @page_owner = User.find(id)
  if id.to_i == session[:user_id]
    erb :'/user/profile'
  else
    erb :'/user/show'
  end
end

get '/user/:id/edit' do |id|
  protected!
  @user = User.find(id)
  if session[:user_id] == id.to_i
    erb :'user/edit'
  else
    redirect('/')
  end
end

put '/user/:id/edit' do |id|
  protected!
  @user = User.find(id)
  @user.stds << Std.find(params[:std].to_i)
  @user.update(params[:user])
  redirect("user/#{@user.id}")
end

get '/user/:id/deactivate' do
  protected!
  erb :'user/deactivate'
end

delete '/user/:id/deactivate' do |id|
  @user = User.find(id)
  @user.destroy
  redirect('/')
end


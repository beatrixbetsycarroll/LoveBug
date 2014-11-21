get '/' do
  if session[:user_id]
    redirect("user/#{session[:user_id]}")
  else
  erb :'/user/login'
  end
end

get '/user/new' do
  erb :'/user/new'
end

post '/user' do
  p params
  p session
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

get '/user/:id' do
  erb :'/user/show'
end

get '/user/:id/edit' do |id|
  if session[:user_id] == id
    erb :'user/edit'
  else
    redirect('/')
  end
end

put '/user/:id/edit' do |id|
  @user = User.find(id)
  @user.update(params[:user])
  redirect("user/#{@user.id}")
end

get '/user/:id/deactivate' do
  erb :'user/deactivate'
end

delete '/user/:id/deactivate' do |id|
  @user = User.find(id)
  @user.destroy
  redirect('/')
end


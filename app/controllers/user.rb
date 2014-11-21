get '/user/:id' do

  erb :'user/show'
end

get '/user/new' do
  erb :'user/new'
end

post '/user/new' do
  @user = User.new(params[:user])
    if @user.save
      redirect("user/#{@user.id}")
    else
      session[:errors] = user.errors.messages
      redirect("user/new")
    end
end

get '/user/login' do
  erb :'user/login'
end

post '/user/login' do
  user = User.find_by(user_name: params[:user][:user_name]).try(:authenticate, params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect("user/#{@user.id}")
  else
    session[:errors] = user.errors.messages
    redirect('/')
  end
end

get '/user/logout' do
  session[:user_id] = nil
  redirect('/')
end


get '/user/:id/edit' do |id|
  if session[:user_id] == id
    erb: 'user/edit'
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


get 'user/:id' do

  erb :'user/show'
end

get 'user/new' do
  erb :'user/new'
end

post 'user/new' do
  @user = User.new(params[:user])
    if @user.save
      redirect("user/#{@user.id}")
    else
      session[:errors] = user.errors.messages
      redirect("user/new")
end

get 'user/login' do
  erb :'user/login'
end

post '/login' do
  user = User.find_by(user_name: params[:user][:user_name]).try(:authenticate, params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect('/')
  else
    session[:errors] = user.errors.messages
    redirect('/login')
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect('/')
end


get 'user/:id/edit' do |id|
  if session[:user_id] == id
    erb: 'user/edit'
  else
    redirect('/')
end

put 'user/:id/edit' do |id|
  @user = User.find(id)
  @user.update(params[:user])
  redirect("user/#{@user.id}")
end

end


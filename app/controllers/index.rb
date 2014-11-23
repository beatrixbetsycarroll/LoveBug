get '/' do
  if session[:user_id]
    redirect("user/#{session[:user_id]}")
  else
  erb :'/user/login'
  end
end

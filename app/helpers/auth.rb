def logged_in?
  session[:user_id] != nil
end

def protected!
  redirect('/') unless logged_in?
end

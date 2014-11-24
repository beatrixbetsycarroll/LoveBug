def logged_in?
  session[:user_id] != nil
end

def protected!
  redirect('/') unless logged_in?
end

def check_trustworthiness(user)
  first_check = TrustRelationship.where('user_a_id = ? AND user_b_id = ?', session[:user_id], user.id)
  second_check = TrustRelationship.where('user_a_id = ? AND user_b_id = ?', user.id, session[:user_id])
  return false if first_check.empty? && second_check.empty?
  true
end

# IS THIS WORKING??

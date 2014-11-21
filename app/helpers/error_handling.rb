def display_errors
  errors = session[:errors]
  session[:errors] = nil

  return errors
end

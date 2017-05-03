class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :authenticate_user

  protected
def authenticate_user
  if session[:user_id]
     # set current user object to @current_user object variable
    @current_user = User.find(session[:user_id])                      # @current_user defined here and therefore we can write current_user excluding @ in other controllers (because it is the base class)
    return true
  else
    redirect_to(:controller => 'sessions', :action => 'login')
    return false
  end
end

def save_login_state
  if session[:user_id]
    redirect_to(:controller => 'sessions', :action => 'home')
    return false
  else
    return true
  end
end

end

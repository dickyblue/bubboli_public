module SessionsHelper


  def sign_in(user)
    session[:user_id] = user.id
  end
    
  def signed_in?
    !current_user.nil?
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def sign_out
    current_user = nil
    session[:user_id] = nil
  end

  def deny_access
    store_location
    redirect_to sign_in_path, :notice => "Please sign in to access this page"
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  private
  
    def authenticate
      deny_access unless current_user
    end
    
    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end

end
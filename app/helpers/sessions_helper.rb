module SessionsHelper
  def log_in(user)
    if user.instance_of? User
      session[:user_id] = user.id
    else
      session[:department_id] = user.id
    end
  end

  def current_user
    if session[:department_id].nil?
      @current_user ||= User.find_by(id: session[:user_id])
      @current_dep ||= Department.find(@current_user.department.id)
    else
      @current_dep ||= Department.find_by(id: session[:department_id])
    end
  end

  def dep?
    @current_dep != nil && @current_user == nil
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    session.delete(:department_id)
    @current_user = nil
    @current_dep = nil
    redirect_to login_path
  end
  
  def go_login
    unless logged_in?
      flash[:danger] = "Duhet te kyqeni paraprakisht."
      redirect_to login_path
    end
  end
  
end

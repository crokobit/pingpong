class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :user_signed_in?, :correct_user?, :admin?, :reviewer?

  private
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
  end

  def user_signed_in?
    return true if current_user
  end

  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url, :alert => "Access denied."
    end
  end

  def authenticate_user!
    if !current_user
      remember_location
      redirect_to signin_path
    end
  end

  def authenticate_reviewer!
    redirect_to root_url unless reviewer?
  end

  def authenticate_admin!
    unless admin?
      redirect_to root_url
    end
  end

  def admin?
    user_signed_in? and current_user.admin?
  end

  def reviewer?
    admin? or (user_signed_in? and current_user.reviewer?)
  end

  def remember_location
    if request.get? and !request.xhr?
      session[:location] = request.url
    end
  end

end

class UsersController < ApplicationController

  def update
    if email_param.present? and current_user.email.blank?
      current_user.email = email_param
      current_user.save
      flash[:notice] = "Thanks!"
    end
    redirect_to :back
  end

  private

  def email_param
    params.fetch(:user, {}).permit(:email)[:email]
  end

end

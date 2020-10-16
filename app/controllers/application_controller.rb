class ApplicationController < ActionController::Base
  before_action :require_sign_in

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete(:user_id)
  end

  def signed_in?
    current_user.present?
  end

  private

  def require_sign_in
    redirect_to sign_in_path unless signed_in?
  end
end

class SessionsController < ApplicationController
  skip_before_action :require_sign_in, only: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user&.authenticate(session_params[:password])
      sign_in user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

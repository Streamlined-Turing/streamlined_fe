class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def create
    user_data = JWT.decode(params[:credential], nil, false).first
    @user = UserFacade.login(user_data)
    session[:user] = @user

    if self.onboarded?
      redirect_to dashboard_path
    else
      redirect_to onboarding_path
    end
  end

  def edit
  end

  def update
    user = UserFacade.onboard(current_user, params[:username])

    session[:user] = user
    redirect_to dashboard_path
  end

  def destroy
    session[:user] = nil
    redirect_to root_path
  end

  private

  def onboarded?
    @user[:username] != nil
  end
end

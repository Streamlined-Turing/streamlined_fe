class LoginController < ApplicationController
  def index; end

  def create
    user_data = request.env['omniauth.auth']
    user_json = UserSerializer.serialize(user_data)
    @user = UserFacade.login(user_json)

    if self.onboarded?
      session[:user] = @user
      redirect_to dashboard_path
    else
      session[:user] = @user
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

  private

  def onboarded?
    @user[:username] != ''
  end
end

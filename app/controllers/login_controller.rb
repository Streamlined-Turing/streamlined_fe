class LoginController < ApplicationController
  def index; end

  def create
    user_data = request.env['omniauth.auth']
    user_json = UserSerializer.serialize(user_data)
    user = UserFacade.login(user_json)

    if user[:user_name] == ''
      redirect_to onboarding_path
    else
      session[:user] = user
      redirect_to dashboard_path
    end
  end

  def edit

  end
end

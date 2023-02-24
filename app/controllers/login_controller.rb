class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def create
    require 'pry'; binding.pry
    user_data = request.env['omniauth.auth']
    user_json = UserSerializer.serialize(user_data)

    user_id = UserFacade.login(user_json)
    session[:user_id] = user_id
    redirect_to root_path
  end
end

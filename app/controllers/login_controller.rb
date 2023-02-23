class LoginController < ApplicationController
  def index; end

  def create
    user_data = request.env['omniauth.auth']
    user_json = UserSerializer.serialize(user_data)
    user = UserFacade.new(user_json)
    session[:user_id] = user.id
    redirect_to root_path
  end
end

class LoginController < ApplicationController
  def index; end

  def create
    user_data = request.env['omniauth.auth']
    pertinant_info = UserSerializer.serialize(user_data)
    require 'pry'; binding.pry
  end
end

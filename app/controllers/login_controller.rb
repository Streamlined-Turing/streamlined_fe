class LoginController < ApplicationController
  def index; end

  def create
    user_data = request.env['omniauth.auth']
    pertinant_info = UserSerializer.new(user_data)
    require 'pry'; binding.pry
  end
end

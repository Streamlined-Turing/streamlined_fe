class UsersController < ApplicationController
  before_action :fetch_user, only: %i[show]

  def show; end

  private

  def fetch_user
    @user = session[:user]
  end
end

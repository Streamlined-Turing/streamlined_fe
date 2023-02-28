class SessionController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :logged_in, only: :edit

  def index; end

  def create
    user_data = Google::Auth::IDTokens.verify_oidc(params[:credential])
    @user = UserFacade.login(user_data)
    session[:user_id] = @user.id

    if self.onboarded?
      redirect_to dashboard_path
    else
      redirect_to onboarding_path
    end
  end

  def edit; end

  def update
    user = UserFacade.edit_user(current_user, params[:username])

    session[:user_id] = user.id
    redirect_to dashboard_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def logged_in
    if current_user.nil?
      flash[:alert] = 'Must be logged in to access the onboarding page'
      redirect_to root_path
    end
  end

  def onboarded?
    @user.username != nil
  end
end

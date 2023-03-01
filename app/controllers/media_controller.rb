class MediaController < ApplicationController
  before_action :logged_in, only: :show
  
  def show
    @media = MediaFacade.media(params[:id])
  end

  private 

  def logged_in 
    if current_user.present?
      @user = UserFacade.get(current_user)
    end
  end
end

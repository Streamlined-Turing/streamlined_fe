class MediaController < ApplicationController
  before_action :logged_in, only: :show
  
  def show
    @media = MediaFacade.media(params[:id], current_user)
  end

  def update
    MediaService.media_list_update(params[:id], current_user, params[:list])
  end

  private 

  def logged_in 
    if current_user.present?
      @user = UserFacade.get(current_user)
    end
  end
end

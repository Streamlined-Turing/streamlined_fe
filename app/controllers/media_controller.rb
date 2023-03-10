class MediaController < ApplicationController
  before_action :logged_in, only: :show
 
  def show
    @media = MediaFacade.media(params[:id], current_user)
  end

  def update
    MediaService.media_list_update(params[:id], current_user, params[:list]) if params[:list]
    MediaService.media_rating_update(params[:id], current_user, params[:rating]) if params[:rating]
    redirect_back(fallback_location: root_path)
  end

  def destroy
    MediaService.delete_from_list(params[:id], current_user)
    redirect_back(fallback_location: root_path)
  end

  private 

  def logged_in 
    if current_user.present?
      @user = UserFacade.get(current_user)
    end
  end
end

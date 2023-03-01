class MediaController < ApplicationController
  def show
    @media = MediaFacade.media(params[:id], current_user)
  end
end

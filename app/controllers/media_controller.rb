class MediaController < ApplicationController
  def show
    @media = MediaFacade.media(params[:id])
  end
end

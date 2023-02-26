class LandingController < ApplicationController
  def index
    @trending_media = MediaFacade.trending_media
  end
end

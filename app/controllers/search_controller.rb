class SearchController < ApplicationController

  def index 
    @media_query = params[:query]
    @media_results = MediaFacade.search_results(@media_query)
  end
end
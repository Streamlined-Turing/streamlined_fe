class SearchController < ApplicationController

  def index 
    @media_query = params[:query]
    
  end
end
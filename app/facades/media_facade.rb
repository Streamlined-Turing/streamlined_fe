class MediaFacade 
  
  def self.search_results(media_query)
    data = MediaService.media_search(media_query)
    limit_15 = data[:data].first(15)
    limit_15.map do |media_result_data|
      MediaResult.new(media_result_data)
    end
  end 

  def self.trending_media 
    response = MediaService.trending_media_search 
    response[:data].map do |trending_media_data|
      MediaResult.new(trending_media_data)
    end
  end
end
class MediaFacade 
  def self.media(id, user_id = nil)
    media_data = MediaService.media(id, user_id)[:data]
    Media.new(media_data)
  end

  def self.search_results(media_query)
    data = MediaService.media_search(media_query)
    limit_15 = data[:data].first(15)
    limit_15.map do |media_result_data|
      Media.new(media_result_data)
    end
  end 

  def self.trending_media 
    response = MediaService.trending_media_search 
    response[:data].map do |trending_media_data|
      Media.new(trending_media_data)
    end
  end
end

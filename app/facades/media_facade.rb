class MediaFacade 
  def self.media(id, user_id = nil)
    media_data = MediaService.media(id, user_id)[:data]
    Media.new(media_data)
  end

  def self.list_results(current_user, list_name)
  
    list_data = MediaService.list_search(current_user, list_name)
    list_data[:data].map do |list_result|
      Media.new(list_result)
    end
  end

  def self.search_results(media_query, user_id = nil)
    data = MediaService.media_search(media_query, user_id)
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

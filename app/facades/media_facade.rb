class MediaFacade 
  
  def self.search_results(media_query)
    data = MediaService.media_search(media_query)
    results = data[:data].find_all do |media|
      media[:attributes][:title].downcase.include?(media_query.downcase)
    end 
    limit_15 = results.first(15)
    limit_15.map do |media_result_data|
      MediaResult.new(media_result_data)
    end
  end 
end
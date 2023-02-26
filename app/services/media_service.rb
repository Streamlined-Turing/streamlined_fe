class MediaService 

  def self.trending_media_search 
    parse_data(conn.get("/api/v1/trending_media"))
  end

  def self.media_search(media_query)
    parse_data(conn.get("/api/v1/media?q=#{media_query}"))
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn 
    Faraday.new(url: 'http://localhost:5000')
  end
end
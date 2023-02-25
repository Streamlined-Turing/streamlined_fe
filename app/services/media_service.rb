class MediaService 

  def self.media_search(media_query)
    parse_data(conn.get("/api/v1/search?q=#{media_query}"))
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn 
    Faraday.new(url: 'http://localhost:5000')
  end
end
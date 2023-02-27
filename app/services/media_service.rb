class MediaService

  def self.media(id)
    parse(conn.get("/api/v1/media/#{id}"))
  end

  def self.trending_media_search 
    parse(conn.get("/api/v1/trending_media"))
  end

  def self.media_search(media_query)
    parse(conn.get("/api/v1/media?q=#{media_query}"))
  end

  private

  def self.conn
    Faraday.new(service_params)
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.service_params
    {
      url: ENV['media_base_url']
    }
  end
end

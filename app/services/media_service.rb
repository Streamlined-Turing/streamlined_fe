class MediaService

  def self.media(id)
    parse(conn.get("/api/v1/media/#{id}"))
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
      url: 'http://localhost:5000',
    }
  end
end
class MediaService

  def self.media(id, user_id = nil)
    parse(conn.get("/api/v1/media/#{id}") do |r|
      r.params = {user_id: user_id}
    end)
  end

  def self.trending_media_search 
    parse(conn.get("/api/v1/trending_media"))
  end

  def self.media_search(media_query)
    parse(conn.get("/api/v1/media?q=#{media_query}"))
  end

  def self.list_search(current_user, list_query)
    parse(conn.get("/api/v1/users/#{current_user}/lists?list=#{list_query}"))
  end

  def self.media_list_update(media_id, user_id, list_name)
    conn.patch("/api/v1/users/#{user_id}/media/#{media_id}") do |r|
       
    end
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

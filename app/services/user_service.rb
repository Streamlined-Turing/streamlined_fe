class UserService
  def self.conn
    Faraday.new(service_params)
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.login(user_data)
    response = conn.post('/api/v1/users') do |req|
      req.body = user_data
    end

    parse(response)
  end

  def self.edit_user(current_user, username)
    response = conn.patch("/api/v1/users/#{current_user['id']}") do |req|
      req.body = { username: username }
    end

    parse(response)
  end

  def self.service_params
    {
      url: ENV['user_base_url']
    }
  end
end

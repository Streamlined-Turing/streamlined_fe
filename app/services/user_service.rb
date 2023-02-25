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

  def self.onboard(current_user, username)
    current_user['username'] = username
    response = conn.patch("/api/v1/users/#{current_user['id']}") do |req|
      req.body = current_user
    end

    parse(response)
  end

  private

  def self.service_params
    {
      url: 'http://localhost:5000',
    }
  end
end

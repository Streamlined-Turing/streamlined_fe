class UserService
  def self.conn
    Faraday.new(url: 'http://localhost:5000')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.login(user_data)
    response = conn.post('/api/v1/users') do |req|
      req.params = user_data
    end

    parse(response)
  end

  def self.onboard(current_user, username)
    current_user['username'] = username
    response = conn.patch('/api/v1/users') do |req|
      req.params = current_user
    end

    parse(response)
  end
end

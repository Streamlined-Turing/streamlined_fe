class UserService
  def self.conn
    Faraday.new(url: 'http://localhost:5000')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.login(user_data)
    response = conn.post('/users') do |req|
      req.body = user_data.to_json
    end

    parse(response)
  end

  def self.onboard(current_user, user_name)
    current_user['user_name'] = user_name
    response = conn.patch('/users') do |req|
      req.body = current_user.to_json
    end

    parse(response)
  end
end

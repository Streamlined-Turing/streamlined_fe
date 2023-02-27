class User
  attr_reader :id,
              :sub,
              :name,
              :username,
              :email,
              :picture

  def initialize(user_data)
    @id = user_data[:id]
    @sub = user_data[:attributes][:sub]
    @name = user_data[:attributes][:name]
    @username = user_data[:attributes][:username]
    @email = user_data[:attributes][:email]
    @picture = user_data[:attributes][:picture]
  end
end

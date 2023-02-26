class User
  attr_reader :id,
              :sub,
              :name,
              :username,
              :email,
              :picture

  def initialize(user_data)
    @id = user_data[:id]
    @sub = user_data[:sub]
    @name = user_data[:name]
    @username = user_data[:username]
    @email = user_data[:email]
    @picture = user_data[:picture]
  end
end

class UserFacade

  def self.format(data)
    # TODO: Consider a Struct or PORO for User data.
    require 'pry'; binding.pry
    {
      id: data[:id],
      sub: data[:attributes][:sub],
      name: data[:attributes][:name],
      username: data[:attributes][:username],
      email: data[:attributes][:email],
      picture: data[:attributes][:picture]
    }
  end

  def self.login(user_data)
    format(UserService.login(user_data)[:data])
  end

  def self.onboard(current_user, username)
    format(UserService.onboard(current_user, username)[:data])
  end
end

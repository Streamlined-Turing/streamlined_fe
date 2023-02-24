class UserFacade

  def self.format(data)
    # TODO: Consider a Struct or PORO for User data.

    {
      id: data[:id],
      uid: data[:attributes][:uid],
      full_name: data[:attributes][:full_name],
      username: data[:attributes][:username],
      email: data[:attributes][:email],
      first_name: data[:attributes][:first_name],
      last_name: data[:attributes][:last_name],
      image: data[:attributes][:image]
    }
  end

  def self.login(user_data)
    format(UserService.login(user_data)[:data])
  end

  def self.onboard(current_user, username)
    format(UserService.onboard(current_user, username)[:data])
  end
end

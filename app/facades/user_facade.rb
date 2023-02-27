class UserFacade
  # def self.format(data)
  #   # TODO: Consider a Struct or PORO for User data.
  #   {
  #     id: data[:id],
  #     sub: data[:attributes][:sub],
  #     name: data[:attributes][:name],
  #     username: data[:attributes][:username],
  #     email: data[:attributes][:email],
  #     picture: data[:attributes][:picture]
  #   }
  # end

  def self.login(user_data)
    response = UserService.login(user_data)[:data]

    User.new(response)
  end

  def self.edit_user(current_user, username)
    response = UserService.edit_user(current_user, username)[:data]

    User.new(response)
  end

  def self.get(current_user)
    response = UserService.get(current_user)[:data]

    User.new(response)
  end
end

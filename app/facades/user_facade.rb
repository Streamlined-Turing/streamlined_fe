class UserFacade
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

  def self.delete(current_user)
    UserService.delete(current_user)
  end
end

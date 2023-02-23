class UserFacade
  def self.login(user_data)
    UserService.login(user_data)[:id]
  end
end

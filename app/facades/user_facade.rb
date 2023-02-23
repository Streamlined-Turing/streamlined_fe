class UserFacade
  def self.login(json)
    UserService.login(json)[:id]
  end
end

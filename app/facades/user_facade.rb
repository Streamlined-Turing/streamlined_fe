class UserFacade
  def self.login(user_data)
    data = UserService.login(user_data)[:data]

    {
      id: data[:id],
      google_id: data[:attributes][:uid],
      full_name: data[:attributes][:full_name],
      user_name: data[:attributes][:user_name],
      email: data[:attributes][:email],
      first_name: data[:attributes][:first_name],
      last_name: data[:attributes][:last_name],
      image: data[:attributes][:image]
    }
  end
end

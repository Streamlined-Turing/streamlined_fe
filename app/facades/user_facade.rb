class UserFacade

  def self.format(data)
    # User = Struct.new(:id, :google_id, :full_name, :user_name, :email, :first_name, :last_name, :image)

    # user = User.new(
    #   data[:id],
    #   data[:attributes][:uid],
    #   data[:attributes][:full_name],
    #   data[:attributes][:user_name],
    #   data[:attributes][:email],
    #   data[:attributes][:first_name],
    #   data[:attributes][:last_name],
    #   data[:attributes][:image]
    # )
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

  def self.login(user_data)
    format(UserService.login(user_data)[:data])
  end

  def self.onboard(current_user, user_name)
    format(UserService.onboard(current_user, user_name)[:data])
  end
end

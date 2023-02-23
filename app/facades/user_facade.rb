class UserFacade

  def self.format(data)
    # This is for using a struc
    # User = Struct.new(:id, :uid, :full_name, :username, :email, :first_name, :last_name, :image)

    # user = User.new(
    #   data[:id],
    #   data[:attributes][:uid],
    #   data[:attributes][:full_name],
    #   data[:attributes][:username],
    #   data[:attributes][:email],
    #   data[:attributes][:first_name],
    #   data[:attributes][:last_name],
    #   data[:attributes][:image]
    # )

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

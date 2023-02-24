class UserSerializer
  def self.serialize(data)
    {
      uid: data[:uid],
      full_name: data[:info][:name],
      email: data[:info][:email],
      first_name: data[:info][:first_name],
      last_name: data[:info][:last_name],
      image: data[:info][:image]
    }
  end
end

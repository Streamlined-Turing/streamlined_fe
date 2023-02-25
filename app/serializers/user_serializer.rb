class UserSerializer
  def self.serialize(data)
    {
      sub: data[:sub],
      name: data[:info][:name],
      email: data[:info][:email],
      picture: data[:info][:picture]
    }
  end
end

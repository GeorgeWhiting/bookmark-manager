require 'bcrypt'
class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :password_digest, Text
  #because 50 chars isnt enough for the hashing algorithm

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end

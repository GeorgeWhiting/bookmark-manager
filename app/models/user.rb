require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text
  #because 50 chars isnt enough for the hashing algorithm
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_auth
    @password = BCrypt::Password.new(password_digest)
  end

  def authenticate(password)
    password_auth == password
  end
end

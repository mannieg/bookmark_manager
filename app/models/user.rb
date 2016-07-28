require 'bcrypt'

class User

  include DataMapper::Resource

  attr_accessor :password_repeat

  property :id,      Serial # Serial means that it will be auto-incremented for every record
  property :email,   String

  property :password_digest, String, length: 60

  validates_confirmation_of :password_digest, :confirm => :password_repeat

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end


end

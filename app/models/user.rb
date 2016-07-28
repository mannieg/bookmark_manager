require 'bcrypt'

class User

  include DataMapper::Resource

  attr_writer :password_repeat

  property :id,      Serial # Serial means that it will be auto-incremented for every record
  property :email,   String,  :required => true

  property :password_digest, String, length: 60

  validates_format_of :email, :as => :email_address
  validates_confirmation_of :password_digest, :confirm => :password_repeat

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  private

  attr_reader :password_repeat

end

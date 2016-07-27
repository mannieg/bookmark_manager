require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :password, BCryptHash

end

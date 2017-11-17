require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,             Serial
  property :email,          String
  property :password_hash,  Text

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end

require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  def self.find_user_by_email_and_password(email, password)
    user = find_by_email(email)
    !user.nil? && user.password == password ? user : nil    
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

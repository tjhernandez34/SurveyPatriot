class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password_hash
  validates_uniqueness_of :email

  include BCrypt
  has_many        :surveys
  has_many        :rounds

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def logged_in?(session)
    session[:id] == id
  end
  
end

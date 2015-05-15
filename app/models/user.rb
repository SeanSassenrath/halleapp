class User < ActiveRecord::Base

  has_many :spots

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password ||= Password.create(new_password)
    self.password_hash = @password
  end

  validates :email, presence: :true
  validates :password_hash, presence: :true
end

class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    @user = find_by_email(email.downcase)
    @user && @user.authenticate(password)
  end


  
end

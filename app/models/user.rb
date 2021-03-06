class User < ApplicationRecord

  has_secure_password
	validates :firstname, presence: true
	validates :lastname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 5 }

  def self.authenticate_with_credentials(email, password)

    user = User.find_by_email(email.strip.downcase)

    if user && user.authenticate(password) 
      user
    else
      nil
    end
  end
end

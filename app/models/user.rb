class User < ActiveRecord::Base

# attr_accessible :name, :email, :password, :password_confirmation

  before_save { self.email = self.email.downcase }
  before_create :create_remember_token

  has_many :products
  has_many :orders

# Validations
  validates :name,         presence: true,
                           uniqueness: true
  
  validates :email,        presence: true,
                           uniqueness: true

  # User authentication should take care of password validation automatically. SS

  # validates :password,     presence: true,
  #                          confirmation: true
  
  # validates :password_confirmation,   presence: true                        

  # Create a new token for user
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # Encrypt the user's token using SHA1 algo - faster than Bcrypt & will run on every page.
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  # Method on class User - token gets added to Users database.
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end

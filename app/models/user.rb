class User < ActiveRecord::Base

# attr_accessible :name, :email, :password, :password_confirmation

  before_save { self.email = self.email.downcase }
  before_save :encrypt_password
  before_create :create_remember_token
  after_save :clear_password

  has_many :products
  has_many :orders
  has_one  :cart 
  has_many :checkout

# Validations
  validates :name,      presence: true,
                        uniqueness: true
  
  validates :email,     presence: true,
                        uniqueness: true

  # User authentication should take care of password validation automatically. SS

  validates :password,     presence: true,
                           confirmation: true

  #format { with: /^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{8,}$/ }
  #message: 'Password must contain at least one letter, one number, and 8 or more characters'

  
  validates :password_confirmation,   presence: true
  #validates_length_of :password, :in => 8..20, :on => :create

  # Create a new token for user
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  #Encrypt the user's token using SHA1
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  # Authenticate my password
  def self.authenticate(email, password)
    user = User.find_by_email(email)
    #raise "#{user.password}, #{BCrypt::Engine.hash_secret(password, user.salt)}"
    if user && user.password == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end

  private

  # Method on class User - token gets added to Users database.
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end


end

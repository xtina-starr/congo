class User < ActiveRecord::Base
# attr_accessible :name, :email, :password, :password_confirmation

# Associations 
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


end

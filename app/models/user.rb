class User < ActiveRecord::Base

  has_many :products
  has_many :orders
  has_many :checkout

  has_secure_password
  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email

end

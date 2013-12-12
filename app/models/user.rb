class User < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true

  has_many :products
  has_many :orders
end

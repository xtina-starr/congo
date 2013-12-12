class User < ActiveRecord::Base
  validates :name, :email, presence: true

  has_many :products
  has_many :orders
end

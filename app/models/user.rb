class User < ActiveRecord::Base

	has_many :reviews
  validates :name, :email, presence: true

  has_many :products
  has_many :orders
end

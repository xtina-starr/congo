class Product < ActiveRecord::Base
  belongs_to :users
  has_many :orders
  has_many :order_items
  has_many :ratings
end

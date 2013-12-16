class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  #To do -> figure out how to validate association presence w/out breaking save
  #validates :order_item, presence: true
  has_many :products, through: :order_items

end

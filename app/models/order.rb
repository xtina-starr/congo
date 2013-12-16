class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items



# order validations
# must have one or more order items

end

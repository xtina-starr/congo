class CartItem < ActiveRecord::Base
  belongs_to :products
  belongs_to :cart
  
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end

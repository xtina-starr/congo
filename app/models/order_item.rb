class OrderItem < ActiveRecord::Base
  belongs_to :products
  belongs_to :order
  
<<<<<<< HEAD
  validates :quantity, presence: true, numericality: { greater_than: 0 }
=======

# validations

# must belong to products
# must belong to order
# quantity must be present
# quantity must be an integer
# quantity must be > 0


>>>>>>> master
end

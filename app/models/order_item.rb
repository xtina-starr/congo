class OrderItem < ActiveRecord::Base
  belongs_to :products
  belongs_to :order
  

# validations

# must belong to products
# must belong to order
# quantity must be present
# quantity must be an integer
# quantity must be > 0


end

class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

# Validations
  validates :quantity,   presence: true,
                         numericality: { only_integer: true },
                         numericality: { :greater_than => 0 }
  

  # validates :quantity, presence: true, numericality: { greater_than: 0 }


# validations

# must belong to products
# must belong to order
# quantity must be present
# quantity must be an integer
# quantity must be > 0


  def subtotal
    quantity * price
  end

end

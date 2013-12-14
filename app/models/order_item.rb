class OrderItem < ActiveRecord::Base
  belongs_to :products
  belongs_to :order

# Validations
  validates :quantity,   presence: true,
                         numericality: { only_integer: true },
                         numericality: { :greater_than => 0 }
  
end

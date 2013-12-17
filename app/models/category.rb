class Category < ActiveRecord::Base

	has_many :products
  has_many :product_to_category_relationships
  has_many :products, through: :product_to_category_relationships

#Validations
  validates :name,     presence: true

end

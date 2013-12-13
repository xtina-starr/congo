class Product < ActiveRecord::Base
  belongs_to :users

  has_many :reviews
  has_many :orders, through: :order_items



    def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end


before save  method
convert money to cents



# Validations
# name must be present & unique
# price must be present
# price must be a number
# price must be greater than 0
# price must belong to user

  end
end

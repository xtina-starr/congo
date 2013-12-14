class Product < ActiveRecord::Base
  validates :price, format: { with: /\A[a-zA-Z]+\z/,
    message: "must be in $dd.cc format" }

  belongs_to :users

  has_many :reviews
  has_many :orders, through: :order_items



    def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end


  before_save do
    @product.price = @product.price * 100 
  end



# Validations
# name must be present & unique
# price must be present
# price must be a number
# price must be greater than 0
# price must belong to user

  end
end

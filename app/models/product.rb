class Product < ActiveRecord::Base
  validates :price, format: { with: /\A[a-zA-Z]+\z/,
    message: "must be in $dd.cc format" }

  belongs_to :users

  has_many :reviews
  has_many :orders, through: :order_items

#Validations
  validates :name,      presence: true,
                        uniqueness: true

  validates :price,     presence: true,
                        numericality: {:greater_than => 0}

                        
    def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end


  before_save do
    @product.price = @product.price * 100 
  end

  end
end

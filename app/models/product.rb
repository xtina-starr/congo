class Product < ActiveRecord::Base
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
  end
end

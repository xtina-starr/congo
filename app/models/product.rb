class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  # validates :price, format: { with: /^(\d*\.\d{1,2}|\d+)$/,
  #   message: "must be in $dd.cc format, ex. $15.45" }

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
  elsif filter_term
    # search = includes(:categories)
    a = filter_term.flat_map do |category|
      search = includes(:categories).where('categories.category LIKE :s', s: "%#{category}%")
    end
  else 
      find(:all)
  end

  before_save do
    @product.price = @product.price * 100 
  end

  end
end

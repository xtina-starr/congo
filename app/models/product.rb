class Product < ActiveRecord::Base
  belongs_to :users
  has_many :orders
  has_many :order_items
  has_many :reviews


    def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end

class Product < ActiveRecord::Base
  belongs_to :users
  has_many :ratings
end

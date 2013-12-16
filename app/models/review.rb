class Review < ActiveRecord::Base
	belongs_to :product
	belongs_to :user


#Validations
  validates :title,     presence: true

  validates :rating,    presence: true,
                        numericality: { in: 1..5}

end

class Review < ActiveRecord::Base
	belongs_to :product
	belongs_to :user

<<<<<<< HEAD
# Validations 
  validates :rating,    presence: true,
                        numericality: { only_integer: true, greater_than_or_equal_to: 1,
                          less_than_or_equal_to: 10 }
                        
=======

#Validations
  validates :title,     presence: true

  validates :rating,    presence: true,
                        numericality: { in: 1..5}

>>>>>>> master
end

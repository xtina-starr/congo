class Review < ActiveRecord::Base
	belongs_to :product
	belongs_to :user


# 	# # Validations
# rating must be present
# rating must be integer
# rating must be between 1 & 5

end

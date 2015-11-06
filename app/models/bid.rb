class Bid < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
	validates :amount, presence: true
	#validate :minimum
	# def self.minimum(amount)
	# 	binding.pry
	# 	if amount < minimum
	# 		errors.add(:amount, "Bidding amount cannot be less than minimum bidding")
	# 	end
	# end

end

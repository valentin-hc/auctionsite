class BidValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		unless value > record.minimum_bid
			record.errors[attribute] << "needs to be more than product minimum bid"
		end
	end
end
class ItemReview < ActiveRecord::Base
	belongs_to :item
	validates :rating, presence: true,
		numericality:{only_integer:true,
		greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
validates :comments, presence: true,
length:{maximum:1000,
		to_long:"Review comments must be less than %{count} characters"}
end

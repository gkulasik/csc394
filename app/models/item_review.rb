class ItemReview < ActiveRecord::Base
	belongs_to :Item

validates :Rating, presence: true,
		numericality:{only_integer: true,
		greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
validates :Comments, presence: true,
length:{maximum:1000,
		to_long:"Review comments must be less than %{count} characters"}
end

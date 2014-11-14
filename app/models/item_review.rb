class ItemReview < ActiveRecord::Base
	belongs_to :item
  belongs_to :customer

validates :rating, presence: true,
		numericality:{only_integer: true,
		greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  
validates :comments, presence: true,
length:{maximum:1000,
		to_long:"Review comments must be less than %{count} characters"}
  
  validates :item_id, :customer_id, presence: true
  
  after_save :update_avg_review
  
  
  def update_avg_review
    item = self.item
    count = item.item_reviews.count
    sum = item.item_reviews.sum(:rating)
    avg = sum.to_d/count.to_d
item.update_attributes(avg_review: avg)
    
  end
end

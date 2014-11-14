class AddCustomerInfoToItemReviews < ActiveRecord::Migration
  def change
    add_reference :item_reviews, :customer, index: true
  end
end

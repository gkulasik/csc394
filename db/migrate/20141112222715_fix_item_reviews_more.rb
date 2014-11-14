class FixItemReviewsMore < ActiveRecord::Migration
  def change
    remove_column :item_reviews, :Comments
    remove_column :item_reviews, :Rating
    add_column :item_reviews, :rating, :integer
    add_column :item_reviews, :comments, :text
  end
end

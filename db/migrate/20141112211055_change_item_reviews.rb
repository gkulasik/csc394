class ChangeItemReviews < ActiveRecord::Migration
  def change
    add_column :item_reviews, :item_id, :integer
    remove_column :item_reviews, :Item_ID
  end
end

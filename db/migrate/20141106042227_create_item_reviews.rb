class CreateItemReviews < ActiveRecord::Migration
  def change
    create_table :item_reviews do |t|
      t.integer :Item_ID
      t.integer :Rating
      t.text :Comments

      t.timestamps
    end
  end
end

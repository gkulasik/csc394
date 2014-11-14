class AddRatingsToItems < ActiveRecord::Migration
  def change
    add_column :items, :avg_review, :decimal, index: true
  end
end

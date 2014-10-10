class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.string :keywords
      t.decimal :unit_price

      t.timestamps
    end
  end
end

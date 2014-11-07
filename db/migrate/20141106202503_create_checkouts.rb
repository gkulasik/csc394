class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.string :card_number
      t.string :csv
      t.string :name_on_card
      t.date :expiration_date
      t.string :shipping_address
      t.string :shipping_city
      t.string :shipping_state_or_province
      t.string :shipping_postal_code
      t.boolean :using_account_address
      t.boolean :verified
      t.references :customer, index: true
      t.references :order_summary, index: true

      t.timestamps
    end
  end
end

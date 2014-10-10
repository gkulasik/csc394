class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state_province
      t.string :postal_code
      t.string :country
      t.string :phone_number
      t.string :email

      t.timestamps
    end
    add_index :customers, :email, unique: true
  end
end

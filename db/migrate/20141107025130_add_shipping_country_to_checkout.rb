class AddShippingCountryToCheckout < ActiveRecord::Migration
  def change
    add_column :checkouts, :shipping_country, :string
  end
end

class Item < ActiveRecord::Base
# Validations.

  validates :title,:description, :keywords, :unit_price,presence: true
  
  has_one :inventory
  before_create :create_item_inventory
  
  
  def create_item_inventory
    self.build_inventory.update_attributes(inventory_amount: 0)
  end
  
end

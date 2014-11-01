class Item < ActiveRecord::Base
# Validations.

  validates :title,:description, :keywords, :unit_price,presence: true
  
  has_one :inventory, dependent: :destroy
  has_many :images, as: :picture, dependent: :destroy
  before_create :create_item_inventory
  accepts_nested_attributes_for :images
  
  def create_item_inventory
    self.build_inventory.update_attributes(inventory_amount: 0)
  end
  
end

class Inventory < ActiveRecord::Base
  belongs_to :item
  validates :inventory_amount, :numericality => {:greater_than => -1}
end

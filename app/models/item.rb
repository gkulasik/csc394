class Item < ActiveRecord::Base
# Validations.

  validates :title,:description, :keywords, :unit_price,presence: true
  
  has_one :inventory, dependent: :destroy
  has_many :images, as: :picture, dependent: :destroy

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :inventory
  has_many :carts, dependent: :destroy
 
  
end

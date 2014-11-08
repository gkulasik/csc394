class Item < ActiveRecord::Base
has_many :ItemReviews, dependent: :destroy
# Validations.

  validates :title,:description, :keywords, :unit_price,presence: true
  
  has_one :inventory, dependent: :destroy
  has_many :images, as: :picture, dependent: :destroy

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :inventory
  has_many :carts, dependent: :destroy
  has_many :order_details
  
  
  def self.search(query)
    if query
      Item.where("title ILIKE ? OR description ILIKE ? OR keywords ILIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
    else
      all
    end
  end
  
end

class Checkout < ActiveRecord::Base
  belongs_to :customer
  belongs_to :order_summary
  validates :card_number, :csv, :name_on_card, :expiration_date, :shipping_address, :shipping_city, :shipping_state_or_province, :shipping_postal_code, :shipping_country, :customer_id,  presence: true

  before_validation :check_address
  
  before_validation :edit_card_info
  
  
  def edit_card_info
    if self.card_number.to_i > 0 && self.csv.to_i > 0
    length = self.card_number.length
    card = self.card_number[-4,4]
    (length-4).times do
      card = card.insert(0,"x")
    end
    self.card_number = card
    csv = ""
    self.csv.length.times do
      csv = csv.insert(0,"x")
    end
    self.csv = csv
  else
    self.errors.add(:card_number, "must be a number.")
    self.errors.add(:csv, "must be a number.")
  end
    
  end
  
  
  def check_address
    if self.using_account_address
      customer = self.customer
      self.shipping_address = customer.address
      self.shipping_city = customer.city
      self.shipping_state_or_province = customer.state_province
      self.shipping_postal_code = customer.postal_code
      self.shipping_country = customer.country
    end
    
  end
end

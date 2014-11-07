class Checkout < ActiveRecord::Base
  belongs_to :customer
  belongs_to :order_summary
  validates :card_number, :csv, :name_on_card, :expiration_date, :shipping_address, :shipping_city, :shipping_state_or_province, :shipping_postal_code, :shipping_country, :customer_id,  presence: true
  before_validation :check_address
  
  
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

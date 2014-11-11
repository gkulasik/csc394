class Customer < ActiveRecord::Base
  VALID_PHONE_NUMBER_REGEX = /\A[2-9][0-9][0-9][2-9][0-9]+\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
  validates :phone_number, presence: true, format: {with: VALID_PHONE_NUMBER_REGEX}
  before_save {self.email = email.downcase}
  validates :password, length: {minimum: 6}, allow_blank: true
  has_secure_password
  validates :name, :address, :city, :state_province, :postal_code, :country, :phone_number, presence: true
  has_many :carts, dependent: :destroy
  has_many :checkouts, dependent: :destroy
  has_many :order_summaries, dependent: :destroy
  
  def has_open_checkout?
    !self.checkouts.find_by(verified: nil).nil?
  end
end

class Customer < ActiveRecord::Base
  VALID_PHONE_NUMBER_REGEX = /\a[2-9][0-9][0-9][2-9][0-9]+\z/
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
  before_save {self.email = email.downcase}
  validates :password, length: {minimum: 6}
  has_secure_password
validates: name, :address, :city, :state_province, :postal_code, :country, :phone_number, presence: true
end

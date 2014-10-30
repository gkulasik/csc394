class Item < ActiveRecord::Base
# Validations.

validates:description, :keywords, :unit_price, presence: true
end

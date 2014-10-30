class Cart < ActiveRecord::Base
belongs_to: customer
has_many:item
validates: customer_id, :item_id, presence: true
add_index: item_id
end

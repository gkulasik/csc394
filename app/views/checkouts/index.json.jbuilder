json.array!(@checkouts) do |checkout|
  json.extract! checkout, :id, :card_number, :csv, :name_on_card, :expiration_date, :shipping_address, :shipping_city, :shipping_state_or_province, :shipping_postal_code, :using_account_address, :verified, :customer_id, :order_summary_id
  json.url checkout_url(checkout, format: :json)
end

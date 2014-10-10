json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :address, :city, :state_province, :postal_code, :country, :phone_number, :email
  json.url customer_url(customer, format: :json)
end

json.array!(@items) do |item|
  json.extract! item, :id, :description, :keywords, :unit_price
  json.url item_url(item, format: :json)
end

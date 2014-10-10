json.array!(@order_summaries) do |order_summary|
  json.extract! order_summary, :id, :customer_id, :order_date, :ship_date, :total_cost
  json.url order_summary_url(order_summary, format: :json)
end

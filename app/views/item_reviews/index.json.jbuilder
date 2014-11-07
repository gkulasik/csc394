json.array!(@item_reviews) do |item_review|
  json.extract! item_review, :id, :Item_ID, :Rating, :Comments
  json.url item_review_url(item_review, format: :json)
end

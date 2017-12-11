json.extract! review, :id, :name, :created_at, :updated_at
json.url review_url(review, format: :json)

json.extract! input, :id, :item_id, :input_date, :description, :quantity, :created_at, :updated_at
json.url input_url(input, format: :json)

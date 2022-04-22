json.extract! sale, :id, :amount, :total_amount, :remaining_amount, :discount, :tax, :customer_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)

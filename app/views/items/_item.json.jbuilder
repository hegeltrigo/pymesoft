json.extract! item, :id, :upc, :sku, :name, :description, :input, :output, :amount_stock, :price, :cost_price, :published, :category_id, :created_at, :updated_at
json.url item_url(item, format: :json)

json.extract! product, :id, :title, :price, :brand, :image, :created_at, :updated_at
json.url product_url(product, format: :json)

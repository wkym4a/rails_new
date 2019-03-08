json.extract! inquiry, :id, :name, :email, :content, :created_at, :updated_at
json.url inquiry_url(inquiry, format: :json)

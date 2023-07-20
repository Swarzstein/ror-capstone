json.extract! expence, :id, :name, :amount, :author_id, :created_at, :updated_at
json.url expence_url(expence, format: :json)

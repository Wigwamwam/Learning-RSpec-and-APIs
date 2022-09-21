json.array! @brands do |brand|
  json.extract! brand, :id, :name, :created_at
    json.models brand.models, partial: 'api/v1/brands/model', as: :model
end


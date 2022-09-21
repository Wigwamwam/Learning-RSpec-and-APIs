# json.extract! @brand, :id, :name
json.(@brand, :id, :name)

json.models @brand.models do |model|
  json.extract! model, :id, :name
    json.vehicles model.vehicles, partial: 'api/v1/brands/vehicle', as: :vehicle
end

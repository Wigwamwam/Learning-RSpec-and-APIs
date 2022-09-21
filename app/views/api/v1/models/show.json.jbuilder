json.model @model, :id, :name, :brand
json.brand @model.brand, :name
json.vehicles @model.vehicles do |vehicle|
  json.extract! vehicle, :id, :name, :legal_identifier, :frame_size, :status
end

# json.(@vehicle, :id, :name, :legal_identifier, :frame_size, :status)
# json.models @vehicle.model, :name
# json.brand @vehicle.model.brand, :name

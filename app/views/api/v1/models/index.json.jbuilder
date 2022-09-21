json.array! @models do |model|
  json.extract! model, :id, :name
  json.brand model.brand, :name
  json.vehicles model.vehicles, :id, :name, :legal_identifier, :frame_size, :status, :updated_at
end

# json.array! @vehicles do |vehicle|
#   json.extract! vehicle, :id, :name, :legal_identifier, :frame_size, :status
#     # json.models vehicle.model, partial: 'api/v1/vehicles/model', as: :model
#     json.models vehicle.model, :name
#     json.brands vehicle.model.brand, :name
# end

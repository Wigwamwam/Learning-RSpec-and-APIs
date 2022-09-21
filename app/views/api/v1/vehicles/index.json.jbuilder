json.array! @vehicles do |vehicle|
  json.extract! vehicle, :id, :name, :legal_identifier, :frame_size, :status
    # json.models vehicle.model, partial: 'api/v1/vehicles/model', as: :model
    json.models vehicle.model, :name
    json.brands vehicle.model.brand, :name
end

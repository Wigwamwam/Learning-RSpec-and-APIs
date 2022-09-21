json.(@vehicle, :id, :name, :legal_identifier, :frame_size, :status)
json.models @vehicle.model, :name
json.brand @vehicle.model.brand, :name

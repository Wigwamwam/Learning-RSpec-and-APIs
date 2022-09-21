json.extract! model, :id, :name
  json.vehicles model.vehicles, partial: 'api/v1/brands/vehicle', as: :vehicle


  # json.extract! brand, :id, :name, :created_at
  #   json.models brand.models, partial: 'api/v1/brands/model', as: :model

  #   json.extract! topic, :id, :name, :description
  #     json.assignments topic.assignments, partial: 'api/v1/courses/assignment', as: :assignment

  # json.comments @restaurant.comments do |comment|
  #   json.extract! comment, :id, :content
  # end

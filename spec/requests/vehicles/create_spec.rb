require 'rails_helper'

RSpec.describe 'Api::V1::ModelsController', type: :request do
  describe 'POST / brand' do
    let(:valid_brand) { Brand.create!(name: 'Brompton') }
    let(:valid_model) { Model.create!(name: 'Wiggin', brand: valid_brand)}

    it 'vehicles linked to model and request test success' do
      post "/api/v1/brands/#{valid_brand.id}/models/#{valid_model.id}/vehicles", params: {
        vehicle:
          { name: 'Steve',
            legal_identifier: 'Hello',
            frame_size: 2,
            status: 'action_required',
            model: valid_model
          }
      }

      expect(response.status).to eq(201)

      current_vehicle = JSON.parse(response.body).deep_symbolize_keys

      expect(current_vehicle[:name]).to eq('Steve')

      expect(Vehicle.count).to eq(1)

      expect(Vehicle.last.name).to eq('Steve')
    end

    it 'invalid Vehicle attributes' do
      post "/api/v1/brands/#{valid_brand.id}/models/#{valid_model.id}/vehicles", params: {
        vehicle:
        { name: '',
          legal_identifier: '',
          frame_size: '',
          status: '',
          model: valid_model
        }
      }

      expect(response.status).to eq(422)

      expect(Vehicle.count).to eq(0)
    end
  end
end

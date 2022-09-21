require 'rails_helper'

RSpec.describe 'Api::V1::VehicleController', type: :request do
  describe 'UPDATE / vehicle' do
    let(:valid_brand) { Brand.create!(name: 'Brompton') }
    let(:valid_model) { Model.create!(name: 'Wiggin', brand: valid_brand)}
    let(:valid_vehicle) { Vehicle.create!(
        name: 'Steve',
        legal_identifier: '1234',
        frame_size: 2,
        status: 'action_required',
        model: valid_model
      )}


    it 'updates vehicle name' do
      patch "/api/v1/brands/#{valid_brand.id}/models/#{valid_model.id}/vehicles/#{valid_vehicle.id}", params: {
        vehicle:
          { name: 'Ipad'}
      }

      expect(response.status).to eq(200)

      current_vehicle = JSON.parse(response.body).deep_symbolize_keys

      expect(current_vehicle[:name]).to eq('Ipad')

      expect(Vehicle.count).to eq(1)

      expect(Vehicle.last.name).to eq('Ipad')
    end
  end
end

require 'rails_helper'

RSpec.describe 'Api::V1::ModelsController', type: :request do
  describe "DELETE /destroy" do
    let(:valid_brand) { Brand.create!(name: 'Brompton') }
    let(:valid_model) { Model.create!(name: 'Wiggin', brand: valid_brand)}
    let(:valid_vehicle) { Vehicle.create!(
        name: 'Steve',
        legal_identifier: '1234',
        frame_size: 2,
        status: 'action_required',
        model: valid_model
      )}

    before do
      delete "/api/v1/brands/#{valid_brand.id}/models/#{valid_model.id}/vehicles/#{valid_vehicle.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'there are no vehicle in the db' do
      expect(Vehicle.count).to eq(0)
    end
  end
end

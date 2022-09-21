require 'rails_helper'

RSpec.describe 'Api::V1::ModelsController', type: :request do
  describe 'POST / brand' do
    let(:valid_brand) { Brand.create!(name: 'Brompton') }

    it 'brands linked to ' do
      post "/api/v1/brands/#{valid_brand.id}/models", params: {
        model:
          { name: 'Wiggin', brand: valid_brand}
      }

      expect(response.status).to eq(201)

      current_model = JSON.parse(response.body).deep_symbolize_keys

      expect(current_model.fetch(:model).fetch(:name)).to eq('Wiggin')

      expect(Model.count).to eq(1)

      expect(Model.last.name).to eq('Wiggin')
    end

    it 'invalid brand attributes' do
      post "/api/v1/brands/#{valid_brand.id}/models", params: {
        model: {
          name: '',
          brand: ''
        }
      }

      expect(response.status).to eq(422)

      expect(Model.count).to eq(0)
    end
  end
end

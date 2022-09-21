require 'rails_helper'

RSpec.describe 'Api::V1::ModelsController', type: :request do
  describe 'POST / brand' do
    let(:valid_brand) { Brand.create!(name: 'Brompton') }
    let(:valid_model) { Model.create!(name: 'Steve', brand: valid_brand)}


    it 'updates model name' do
      patch "/api/v1/brands/#{valid_brand.id}/models/#{valid_model.id}", params: {
        model:
          { name: 'Wiggin', brand: valid_brand}
      }

      expect(response.status).to eq(200)

      current_model = JSON.parse(response.body).deep_symbolize_keys

      expect(current_model.fetch(:model).fetch(:name)).to eq('Wiggin')

      expect(Model.count).to eq(1)

      expect(Model.last.name).to eq('Wiggin')
    end

    it 'invalid model attributes' do
      patch "/api/v1/brands/#{valid_brand.id}/models/#{valid_model.id}", params: {
        model: {
          name: '',
          brand: ''
        }
      }
      expect(response.status).to eq(422)

      current_model = JSON.parse(response.body).deep_symbolize_keys
      expect(current_model[:name]).to eq(nil)

      expect(Model.last.name).to eq('Steve')
    end
  end
end

require 'rails_helper'

RSpec.describe 'Api::V1::ModelsController', type: :request do

  describe 'GET /index' do
    let(:brand) { Brand.create!(name: 'Brompton') }


    before do
      Model.create([{ name: 'Cx 1', brand: brand }, { name: 'PP 50', brand: brand }, { name: 'L99', brand: brand }, { name: '42', brand: brand }, { name: 'Best', brand: brand }, { name: 'Lower', brand: brand }])
      get "/api/v1/brands/#{brand.id}/models"
    end


    it 'returns all models' do
      expect(json.size).to eq(6)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end

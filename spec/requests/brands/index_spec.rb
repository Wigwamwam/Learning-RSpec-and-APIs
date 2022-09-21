require 'rails_helper'

RSpec.describe 'Api::V1::BrandsController', type: :request do

  describe 'GET /index' do
    before do
      FactoryBot.create_list(:brand, 10)
      get api_v1_brands_path
    end

    it 'returns all posts' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end

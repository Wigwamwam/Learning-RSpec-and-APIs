require 'rails_helper'

RSpec.describe 'Api::V1::BrandsController', type: :request do
  describe 'PATCH / Update /brands' do
    # this will create a 'brand' method, which return the created brand object,
    # before each scenario is ran
    let!(:brand) { Brand.create(name: 'Wiggin')}

    scenario 'valid brand attributes' do
      # send patch request to /brands/:id
      patch api_v1_brand_path(brand.id), params: {
        brand: {
          name: 'George'
        }
      }

      # response should have HTTP Status 200 OK
      expect(response.status).to eq(200)

      # response should contain JSON of the updated object
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:name]).to eq('George')

      # The brand title and name should be updated
      expect(brand.reload.name).to eq('George')
    end

    scenario 'invalid brand attributes' do
      # send patch request to /brands/:id
      patch api_v1_brand_path(brand.id), params: {
        brand: {
          name: '',
        }
      }

      # response should have HTTP Status 422 Unprocessable entity
      expect(response.status).to eq(422)

      # response should contain error message
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:name]).to eq(nil)

      # The brand title and name remain unchanged
      expect(brand.reload.name).to eq('Wiggin')
    end
  end

end

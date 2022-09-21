require 'rails_helper'


  # RSpec.describe "Brands", type: :request do
  #   # make a get request
  #   describe 'GET / index' do
  #     before do
  #       brands = Brand.create([{ name: 'Honda' }, { name: 'Yamaha' }, { name: 'Zoomo' }, { name: 'nothng' }])
  #       @json = JSON.parse(response.body)
  #       get '/api/v1/brands'
  #     end

  #     it 'returns all brands' do

  #       expect(@json.count).to eq(4)
  #     end

  #   end
  # end

# RSpec.describe 'Status requests' do
#   describe "GET / Indx " do
#     it "returns a status message" do
#       get('/api/v1/brands')
#       json = JSON.parse(response.body)
#       expect(json['status']).to eq('ok')
#     end
#   end
# end

# RSpec.describe 'Api::V1::BrandsController', type: :request do
#   # headers = { 'ACCEPT' => 'application/json' }
#   describe "Get / API / brands" do
#     it "works!" do
#       get ('/api/v1/brands/index')
#       expect(response).to have_http_status(200)
#     end
#   end
# end

# RSpec.describe 'Api::V1::BrandsController', type: :request do
#   describe "GET / INDEX" do
#     it "returns http success" do
#       get '/api/v1/brands/index'
#       # expect(response.body).to eq('{"status":"online"}')
#       expect(response.body).to eq('{"name":"george"}')
#       expect(response.status).to eq(200)

#     end
#   end
# end


RSpec.describe 'Api::V1::BrandsController', type: :request do
  describe 'POST / brand' do
    it 'valid brand attributes' do
      post api_v1_brands_path, params: {
        brand: {
          name: 'Wiggin'
        }
      }

      expect(response.status).to eq(201)

      json = JSON.parse(response.body).deep_symbolize_keys

      expect(json[:name]).to eq('Wiggin')

      expect(Brand.count).to eq(1)

      expect(Brand.last.name).to eq('Wiggin')
    end

    it 'invalid brand attributes' do
      post api_v1_brands_path, params: {
        brand: {
          name: ''
        }
      }

      expect(response.status).to eq(422)

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:name]).to eq(nil)

      expect(Brand.count).to eq(0)
    end
  end
end

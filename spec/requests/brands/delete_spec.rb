require 'rails_helper'

RSpec.describe 'Api::V1::BrandsController', type: :request do
  describe "DELETE /destroy" do
    let!(:brand) { FactoryBot.create(:brand) }

    before do
      delete "/api/v1/brands/#{brand.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

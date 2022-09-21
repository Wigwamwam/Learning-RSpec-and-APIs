require 'rails_helper'

RSpec.describe 'Api::V1::ModelsController', type: :request do
  describe "DELETE /destroy" do
    let!(:valid_brand) { FactoryBot.create(:brand) }
    let(:valid_model) { Model.create!(name: 'Steve', brand: valid_brand)}

    before do
      delete "/api/v1/brands/#{valid_brand.id}/models/#{valid_model.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

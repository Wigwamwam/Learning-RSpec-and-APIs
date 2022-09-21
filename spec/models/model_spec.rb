require 'rails_helper'

RSpec.describe Model, type: :model do
  let(:valid_brand) { Brand.create!(name: 'Brompton') }
  let(:model) { Model.new(name: 'EV', brand: valid_brand) }

  it "is invalid if model has a brand" do
    model.brand = nil
    expect(model.valid?).to eq false
  end

  it 'is valid with valid attributes' do
    expect(model).to be_valid
  end

  it 'is not valid without a name' do
    model.name = nil
    expect(model).to_not be_valid
  end
end

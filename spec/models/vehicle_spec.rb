require 'rails_helper'

RSpec.describe Vehicle, type: :vehicle do
  let(:valid_brand) { Brand.create!(name: 'Brompton') }
  let(:valid_model) { Model.new(name: 'EV', brand: valid_brand) }
  let(:vehicle) { Vehicle.new(legal_identifier: 'EV', name: 'Sven', frame_size: 4, status: 1, model: valid_model) }

  it "is invalid if vechile is not assigned to a model" do
    vehicle.model = nil
    expect(vehicle.valid?).to eq false

  end

  it 'is not valid without a name' do
    vehicle.name = nil
    expect(vehicle).to_not be_valid
  end

  it 'is not valid without a legal_identifier' do
    vehicle.legal_identifier = nil
    expect(vehicle).to_not be_valid
  end

  it 'is not valid without a frame size' do
    vehicle.frame_size = nil
    expect(vehicle).to_not be_valid
  end


  it 'is not valid without a status' do
    vehicle.status = nil
    expect(vehicle).to_not be_valid
  end

  it 'is valid if frame size is an integer' do
    vehicle.frame_size = 'hello'
    expect(vehicle).to_not be_valid
  end

  it 'is valid if status is an integer' do
    expect(vehicle).to be_valid
  end
end

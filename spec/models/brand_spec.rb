require 'rails_helper'

RSpec.describe Brand, type: :model do
  let(:brand) { Brand.create(name: 'Brompton') }

  it 'is valid with valid attributes' do
    expect(brand).to be_valid
  end

  it 'is not valid without a name' do
    brand.name = nil
    expect(brand).to_not be_valid
  end
end

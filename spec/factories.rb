require 'faker'

FactoryBot.define do
  factory :brand do
    name { Faker::Name.name }
  end

  factory :model do
    name { Faker::Name.name }
    association :brand
  end
end

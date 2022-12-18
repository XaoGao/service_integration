FactoryBot.define do
  to_create(&:save)
  factory :merchant do
    active { true }
    code { Faker::Number.number(digits: 5) }
    name { Faker::Company.name }
  end
end

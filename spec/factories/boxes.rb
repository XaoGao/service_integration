FactoryBot.define do
  to_create(&:save)
  factory :box do
    box_code { Faker::Barcode.ean(8) }
    ax_package_id_lable { Faker::Barcode.ean(8) }
    is_kgt { Faker::Number.between(from: 0.1, to: 10.0) }
    shipping_rejection { 0 }

    sequence(:box_index, 100) { |n| n }
  end
end

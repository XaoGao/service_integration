FactoryBot.define do
  to_create(&:save)
  factory :shipment_item do
    shipment { FactoryBot.create(:shipment) }

    sequence(:item_index, 100) { |n| n }
    status { "init" }
    offer_id { Faker::Barcode.ean(8) }
    seller_id { Faker::Barcode.ean(8) }
    price { Faker::Number.positive }
    final_price { Faker::Number.positive }
    quantity { Faker::Number.between(from: 1, to: 10) }
  end
end

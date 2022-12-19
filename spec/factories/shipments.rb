FactoryBot.define do
  to_create(&:save)
  factory :shipment do
    merchant { FactoryBot.create(:merchant) }

    status { "init" }
    external_num { Faker::Number.number(digits: 10) }
    internal_num { Faker::Number.number(digits: 10) }
    ax_journal_id { Faker::Barcode.ean(8) }
    confirmed_time_limit { DateTime.now }
    packing_time_limit { DateTime.now }
    shipping_time_limit { DateTime.now }
    shipment_date_from { DateTime.now }
    shipment_date_to { DateTime.now }
    delivery_id { 0 }
    delivery_date { DateTime.now }
    delivery_date_from { DateTime.now }
    delivery_date_to { DateTime.now }
    region { Faker::Address.community }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    full_name { Faker::Name.name_with_middle }
    shipping_point { 0 }
    label_text { "" }
    shipping_date { DateTime.now }
    delivery_method_id { 0 }
  end
end

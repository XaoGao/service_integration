FactoryBot.define do
  to_create(&:save)
  factory :shipment_item_to_box do
    shipment_item { FactoryBot.create(:shipment_item) }
    box { FactoryBot.create(:box) }
  end
end

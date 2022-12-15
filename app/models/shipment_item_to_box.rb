class ShipmentItemToBox < Sequel::Model(DB)
  many_to_one :shipment_item
  many_to_one :box
end

class ShipmentItem < Sequel::Model(DB)
  many_to_one :shipment
end

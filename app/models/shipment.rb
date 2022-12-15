class Shipment < Sequel::Model(DB)
  many_to_one :merchant
  one_to_many :shipment_items
end

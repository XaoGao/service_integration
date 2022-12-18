class ShipmentItem < Sequel::Model(DB)
  many_to_one :shipment

  many_to_many :boxes, left_key: :shipment_item_id, right_key: :box_id, join_table: :shipment_item_to_boxes
end

Sequel.migration do
  up do
    create_table(:shipment_item_to_boxes) do
      primary_key :id
      foreign_key :shipment_item_id, :shipment_items
      foreign_key :box_id, :boxes

      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:shipment_item_to_boxes)
  end
end

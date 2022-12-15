Sequel.migration do
  up do
    create_table(:shipment_items) do
      primary_key :id
      foreign_key :shipment_id, :shipments

      Integer  :item_index
      String   :status
      String   :offer_id
      String   :seller_id
      Integer  :price
      Integer  :final_price
      Integer  :quantity

      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:shipment_items)
  end
end

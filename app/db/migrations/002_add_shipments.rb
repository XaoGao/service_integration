Sequel.migration do
  up do
    create_table(:shipments) do
      primary_key :id
      foreign_key :merchant_id, :merchants

      Integer  :status
      String   :external_num
      String   :internal_num
      String   :ax_journal_id
      DateTime :confirmed_time_limit
      DateTime :packing_time_limit
      DateTime :shipping_time_limit
      DateTime :shipment_date_from
      DateTime :shipment_date_to
      Integer  :delivery_id
      DateTime :delivery_date
      DateTime :delivery_date_from
      DateTime :delivery_date_to
      String   :region
      String   :city
      String   :address
      String   :full_name
      String   :shipping_point
      String   :label_text
      DateTime :shipping_date
      Integer  :delivery_method_id

      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:shipments)
  end
end

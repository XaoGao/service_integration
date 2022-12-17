Sequel.migration do
  up do
    create_table(:boxes) do
      primary_key :id

      Integer :box_index
      String  :box_code
      String  :ax_package_id_lable
      Integer :is_kgt
      Integer :shipping_rejection

      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:boxes)
  end
end

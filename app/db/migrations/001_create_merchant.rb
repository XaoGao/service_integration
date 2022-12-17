Sequel.migration do
  up do
    create_table(:merchants) do
      primary_key :id

      Boolean  :active
      String   :code
      String   :name

      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:merchants)
  end
end

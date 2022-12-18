db_config_file = File.join(Application.config.root_path, "app", "db", "database.yml")
if File.exist?(db_config_file)
  db_config = YAML.safe_load(File.read(db_config_file), symbolize_names: true)
  ::DB = Sequel.connect(db_config[Application.config.env])

  Sequel::Model.plugin :timestamps, create: :created_at, update: :updated_at, update_on_create: true
  Sequel::Model.plugin :touch
  Sequel::Model.plugin :validation_helpers
end

if File.exist?(db_config_file) && DB
  Sequel.extension :migration
  Sequel::Migrator.run(DB, File.join(Application.config.root_path, "app", "db", "migrations"))
end

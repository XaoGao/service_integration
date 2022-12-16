db_config_file = File.join(Application.root_path, "app", "db", "database.yml")
if File.exist?(db_config_file)
  config = YAML.safe_load(File.read(db_config_file))
  ::DB = Sequel.connect(config[Application.config.env])

  Sequel::Model.plugin :timestamps, create: :created_on, update: :updated_on, update_on_create: true
  Sequel::Model.plugin :touch
  Sequel::Model.plugin :validation_helpers
end

if File.exist?(db_config_file) && DB
  Sequel.extension :migration
  Sequel::Migrator.run(DB, File.join(Application.root_path, "app", "db", "migrations"))
end

# db_config_file = File.join(File.dirname(__FILE__), '..', 'app', 'db', 'database.yml')
#     if File.exist?(db_config_file)
#       config = YAML.safe_load(File.read(db_config_file))
#       ::DB = Sequel.connect(config['development'])

#       if File.exist?(File.join(File.dirname(__FILE__), '..', 'config', 'sequel_plagins.rb'))
#         require_relative '../config/sequel_plagins'
#       end
#     end

#     if File.exist?(db_config_file) && DB
#       Sequel.extension :migration
#       Sequel::Migrator.run(DB, File.join(File.dirname(__FILE__), '..', 'app', 'db', 'migrations'))
#     end
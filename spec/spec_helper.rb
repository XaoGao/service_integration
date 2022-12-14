ARGV.clear
ARGV[0] = :test
require_relative "../config/application"
require "database_cleaner-sequel"
require "aasm/rspec"
require "factory_bot"

Dir[File.join(Application.config.root_path, "rspec", "factories", "*.rb")].each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include FactoryBot::Syntax::Methods

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.before do
    DatabaseCleaner[:sequel].strategy = :transaction
  end

  config.before do
    DatabaseCleaner[:sequel].start
  end

  config.after do
    DatabaseCleaner[:sequel].clean
  end
end

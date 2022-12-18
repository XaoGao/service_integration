ARGV.clear
ARGV[0] = :test
require_relative "../config/application"
require "database_cleaner-sequel"
require "factory_bot"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include FactoryBot::Syntax::Methods

  # config.filter_run focus: true

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

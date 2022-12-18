require "rubygems"
begin
  require "bundler"
  Bundler.setup
rescue StandardError
end

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "dry-auto_inject"
require "dry-container"
require "dry/transaction"
require "dry/transaction/operation"
require "faraday"
require "sequel"
require "sidekiq"
require "sidekiq-cron"
require "sinatra"
require "sinatra/base"
require "yaml"

if Application.test? || Application.development?
  require "debug"
  require "faker"
end

require "bundler/setup"

# Utils
Dir[File.join(Application.config.root_path, "utils", "*.rb")].each { |file| require file }
# BD
require File.join(Application.config.root_path, "config", "initializers", "initialize_sequel.rb")
# TaskSettings
require File.join(Application.config.root_path, "app", "models", "settings", "tasks", "task.rb")
# AllSettings
Dir[File.join(Application.config.root_path, "app", "models", "settings", "*.rb")].each { |file| require file }
# AllTasks
Dir[File.join(Application.config.root_path, "app", "models", "settings", "tasks", "*.rb")].each { |file| require file }
# AllModels
Dir[File.join(Application.config.root_path, "app", "models", "*.rb")].each { |file| require file }
# AllController
Dir[File.join(Application.config.root_path, "app", "controllers", "*.rb")].each { |file| require file }
# AllSErvices
Dir[File.join(Application.config.root_path, "app", "services", "*.rb")].each { |file| require file }
Dir[File.join(Application.config.root_path, "app", "services", "**", "*.rb")].each { |file| require file }
# Initializers
require File.join(Application.config.root_path, "config", "initializers", "initialize_sellers.rb")
require File.join(Application.config.root_path, "config", "initializers", "initialize_sidekiq.rb")
Dir[File.join(Application.config.root_path, "config", "initializers", "*.rb")].each { |file| require file }
# AllJobs
require File.join(Application.config.root_path, "app", "jobs", "abstract_job.rb")
Dir[File.join(Application.config.root_path, "app", "jobs", "*.rb")].each { |file| require file }

if Application.test? || Application.development?
  Dir[File.join(Application.config.root_path, "rspec", "factories", "*.rb")].each { |file| require file }
end

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "debug"
require "sequel"
require "yaml"
require "sinatra"
require "sidekiq"
require "sidekiq-cron"

require "bundler/setup"

Application.config.env = "development"

# BD
require File.join(Application.root_path, "config", "initializers", "initialize_sequel.rb")
# TaskSettings
require File.join(Application.root_path, "app", "models", "settings", "tasks", "task.rb")
# AllSettings
Dir[File.join(Application.root_path, "app", "models", "settings", "*.rb")].each { |file| require file }
# AllTasks
Dir[File.join(Application.root_path, "app", "models", "settings", "tasks", "*.rb")].each { |file| require file }
# AllModels
Dir[File.join(Application.root_path, "app", "models", "*.rb")].each { |file| require file }
# AllController
Dir[File.join(Application.root_path, "app", "controllers", "*.rb")].each { |file| require file }
# AllJobs
require File.join(Application.root_path, "app", "jobs", "abstract_job.rb")
Dir[File.join(Application.root_path, "app", "jobs", "*.rb")].each { |file| require file }
# Initializers
require File.join(Application.root_path, "config", "initializers", "initialize_sellers.rb")
require File.join(Application.root_path, "config", "initializers", "initialize_sidekiq.rb")
Dir[File.join(Application.root_path, "config", "initializers", "*.rb")].each { |file| require file }

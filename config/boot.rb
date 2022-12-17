ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "debug"
require "sequel"
require "yaml"
require "sinatra"

require "bundler/setup"

# BD
require File.join(Application.root_path, "config", "initializers", "initialize_sequel.rb")
# TaskSettings
require File.join(Application.root_path, "app", "models", "settings", "tasks", "task.rb")
# AllSettings
Dir[File.join(Application.root_path, "app", "models", "settings", "*.rb")].sort.each { |file| require file }
# AllTasks
Dir[File.join(Application.root_path, "app", "models", "settings", "tasks", "*.rb")].sort.each { |file| require file }
# AllModels
Dir[File.join(Application.root_path, "app", "models", "*.rb")].sort.each { |file| require file }
# AllController
Dir[File.join(Application.root_path, "app", "controllers", "*.rb")].sort.each { |file| require file }
# Initializers
require File.join(Application.root_path, "config", "initializers", "initialize_sellers.rb")
Dir[File.join(Application.root_path, "config", "initializers", "*.rb")].sort.each { |file| require file }

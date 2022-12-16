ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "debug"
require "sequel"
require "yaml"
require "sinatra"

require "bundler/setup"

require File.join(Application.root_path, "config", "initializers", "initilaze_sequel.rb")
require File.join(Application.root_path, "app", "models", "settings", "tasks", "task.rb")
# Dir[File.join(SI::Application.root_path, "app", "models", "*.rb")].sort.each { |file| require file }
Dir[File.join(Application.root_path, "app", "models", "settings", "*.rb")].sort.each { |file| require file }
Dir[File.join(Application.root_path, "app", "models", "settings", "tasks", "*.rb")].sort.each { |file| require file }
Dir[File.join(Application.root_path, "app", "controllers", "*.rb")].sort.each { |file| require file }
Dir[File.join(Application.root_path, "config", "initializers", "*.rb")].sort.each { |file| require file }

require "rubygems"
begin
  require "bundler"
  Bundler.setup
rescue StandardError
end

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "aasm"
require "dotenv/load"
require "dry-auto_inject"
require "dry-container"
require "dry-initializer"
require "dry/transaction"
require "dry/transaction/operation"
require "dry-struct"
require "dry/monads"
require "faraday"
require "json"
require "sequel"
require "sidekiq"
require "sidekiq-cron"
require "sinatra"
require "sinatra/base"
require "yaml"
require "mail"
require "zeitwerk"

if Application.test? || Application.development?
  require "debug"
  require "faker"
end

require "bundler/setup"

require File.join(Application.config.root_path, "config", "initializers", "initialize_sequel.rb")
loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/../app")
loader.push_dir("#{__dir__}/../utils")

# TODO: read all folders in app
# dirs = Dir.glob(File.join(__dir__, "..")).select { |f| File.directory? f }

%w[models controllers services jobs].each do |dir|
  loader.push_dir("#{__dir__}/../app/#{dir}")
end

loader.setup # ready!

Dir[File.join(Application.config.root_path, "config", "initializers", "*.rb")].each { |file| require file }

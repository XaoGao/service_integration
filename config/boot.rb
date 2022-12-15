ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "sinatra"
require "debug"
require "yaml"

require "bundler/setup" # Set up gems listed in the Gemfile.
require_relative "../lib/config"
require_relative "../app"

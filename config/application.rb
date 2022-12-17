require "logger"
require_relative "../lib/config"

module Application
  def self.config
    @config ||= Config
  end

  def self.root_path
    @root_path ||= File.join(File.dirname(__FILE__), "..")
  end

  def self.logger
    @logger ||= Logger.new(STDOUT)
  end
end

require_relative "./boot"

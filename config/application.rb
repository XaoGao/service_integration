require "logger"
require "dry-configurable"
# require "dry-logger"

module Application
  extend Dry::Configurable

  setting :root_path, default: File.join(File.dirname(__FILE__), "..")

  setting :env, default: ARGV[0].to_sym #:development

  class << self
    def logger
      @logger ||= Logger.new(STDOUT)
    end

    def development?
      config.env == :development
    end

    def test?
      config.env == :test
    end

    def production?
      config.env == :production
    end
  end
end

require_relative "./boot"

# require "irb"
# IRB.start

require "logger"
require "dry-configurable"

module Application
  extend Dry::Configurable

  setting :root_path, default: File.join(File.dirname(__FILE__), "..")

  setting :env, default: ARGV[0].to_sym

  class << self
    def logger
      @logger ||=
        if ARGV[0].to_sym == :test
          NilLogger.new
        else
          Logger.new(STDOUT)
        end
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

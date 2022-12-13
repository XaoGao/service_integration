require_relative "boot"

module SI
  class Application
    SI::Config.env = ARGV[0]
    def self.root_path
      @root_path ||= File.join(File.dirname(__FILE__), "..")
    end
  end
end

require File.join(SI::Application.root_path, "app", "models", "task.rb")
Dir[File.join(SI::Application.root_path, "app", "models", "*.rb")].sort.each { |file| require file }
Dir[File.join(SI::Application.root_path, "config", "initializers", "*.rb")].sort.each { |file| require file }

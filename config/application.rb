require_relative "../lib/config"

module Application
  def self.config
    @config ||= Config
  end

  def self.root_path
    @root_path ||= File.join(File.dirname(__FILE__), "..")
  end
end

Application.config.env = ARGV[0]

require_relative "./boot"

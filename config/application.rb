require_relative "boot"

module SI
  class Application
    SI::Config.env = ARGV[0]
    def self.root_path
      @root_path ||= File.join(File.dirname(__FILE__), "..")
    end
  end
end

require_relative "../config/initializers/initilaize_sellers"
# Dir[File.join(File.dirname(__FILE__), '..', 'app', '**', '*.rb')].sort.each { |file| require file }
# Dir[File.join(File.dirname(__FILE__), '..', 'config', '**', '*.rb')].sort.each { |file| require file }
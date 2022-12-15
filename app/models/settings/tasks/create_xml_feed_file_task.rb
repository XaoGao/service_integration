module SI
  module Settings
    module Tasks
      class CreateXmlFeedFileTask < Task
        attr_reader :outletid, :feed_filename, :feed_file_directory_path

        def initialize(task)
          super task

          raise StandardError "outletid can not be nil or empty" if task[:outletid].nil?
          raise StandardError "feed_filename can not be nil or empty" if task[:feed_filename].nil?
          raise StandardError "feed_file_directory_path can not be nil or empty" if task[:feed_file_directory_path].nil?

          @outletid = task[:outletid]
          @feed_filename = task[:feed_filename]
          @feed_file_directory_path = task[:feed_file_directory_path]
        end
      end
    end
  end
end

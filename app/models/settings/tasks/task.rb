module SI
  module Settings
    class Task
      attr_reader :name, :run, :schedule

      def initialize(task)
        raise StandardError "name can not be nil or empty" if task[:name].nil?
        raise StandardError "run can not be nil or empty" if task[:run].nil?
        raise StandardError "schedule can not be nil or empty" if task[:schedule].nil?

        @name = task[:name]
        @run = task[:run]
        @schedule = task[:schedule]
      end
    end
  end
end

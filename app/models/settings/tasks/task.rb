module Settings
  class Task
    attr_reader :name, :run, :schedule, :klass

    def initialize(task, klass)
      raise StandardError "name can not be nil or empty" if task[:name].nil?
      raise StandardError "run can not be nil or empty" if task[:run].nil?
      raise StandardError "schedule can not be nil or empty" if task[:schedule].nil?
      raise StandardError "klass can not be nil or empty" if klass.nil?

      @name = task[:name]
      @run = task[:run]
      @schedule = task[:schedule]
      @klass = klass
    end
  end
end

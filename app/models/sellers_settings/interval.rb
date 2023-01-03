module SellersSettings
  class Interval
    attr_reader :work_day, :start_time, :end_time, :b2b_login, :b2b_password

    def initialize(interval)
      raise StandartError "work_day can not be nil or empty" if interval[:work_day].nil?
      raise StandartError "start_time can not be nil or empty" if interval[:start_time].nil?
      raise StandartError "end_time can not be nil or empty" if interval[:end_time].nil?
      raise StandartError "b2b_login can not be nil or empty" if interval[:b2b_login].nil?
      raise StandartError "b2b_password can not be nil or empty" if interval[:b2b_password].nil?

      @work_day = interval[:work_day]
      @start_time = interval[:start_time]
      @end_time = interval[:end_time]
      @b2b_login = interval[:b2b_login]
      @b2b_password = interval[:b2b_password]
    end
  end
end

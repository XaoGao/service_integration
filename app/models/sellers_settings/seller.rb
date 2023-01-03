module SellersSettings
  class Seller
    attr_reader :is_active, :sbermm_auth, :b2b_auth, :tasks_settings, :name

    def initialize(seller)
      raise StandardError "is_active can be nil or empty" if seller[:is_active].nil?
      raise StandardError "sbermm_auth can be nil or empty" if seller[:sbermm_auth].nil?
      raise StandardError "b2b_auth can be nil or empty" if seller[:b2b_auth].nil?
      raise StandardError "tasks_settings can be nil or empty" if seller[:tasks_settings].nil?
      raise StandardError "name can be nil or empty" if seller[:name].nil?

      @is_active = seller[:is_active]
      @sbermm_auth = SbermmAuth.new seller[:sbermm_auth]
      @b2b_auth = B2bAuth.new seller[:b2b_auth]
      @tasks_settings = TasksSettings.new seller[:tasks_settings]
      @name = seller[:name]
    end

    def header_for_work_day
      interval = b2b_auth.intervals.first

      if interval.nil?
        raise StandardError "Нет логина/пароля для получения рабочего дня"
      end

      Account.new(login: interval.b2b_login, password: interval.b2b_password)
    end

    def account_by_interval(work_day)
      interval = b2b_auth.intervals.find { |i| i.work_day == work_day }

      if interval.nil?
        raise StandardError "Нет логина/пароля для указаного дня"
      end

      Account.new(login: interval.b2b_login, password: interval.b2b_password)
    end

    def account
      Account.new(login: b2b_auth.reserves.main_reserve_login, password: b2b_auth.reserves.main_reserve_password)
    end

    def specify_quantity(account)
      b2b_auth.reserves.account == account && tasks_settings.send_stock.set_amount
    end
  end
end

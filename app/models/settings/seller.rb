module Settings
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
  end
end

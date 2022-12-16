module Settings
  class Reserves
    attr_reader :main_reserve_login, :main_reserve_password

    def initialize(reserves)
      raise StandartError "main_reserve_login can not be nil or empty" if reserves[:main_reserve_login].nil?
      raise StandartError "main_reserve_password can not be nil or empty" if reserves[:main_reserve_password].nil?

      @main_reserve_login = reserves[:main_reserve_login]
      @main_reserve_password = reserves[:main_reserve_password]
    end
  end
end

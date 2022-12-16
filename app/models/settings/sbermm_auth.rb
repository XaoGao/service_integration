module Settings
  class SbermmAuth
    attr_reader :token, :login, :password

    def initialize(sbermm_auth)
      raise StandartError "token can not be nil or empty" if sbermm_auth[:token].nil?
      raise StandartError "login can not be nil or empty" if sbermm_auth[:login].nil?
      raise StandartError "password can not be nil or empty" if sbermm_auth[:password].nil?

      @token = sbermm_auth[:token]
      @login = sbermm_auth[:login]
      @password = sbermm_auth[:password]
    end
  end
end

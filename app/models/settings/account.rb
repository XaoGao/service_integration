module Settings
  class Account
    attr_reader :login, :password

    def initialize(login, password)
      raise StandardError "login can not be nil or empty" if login.nil?
      raise StandardError "password can not be nil or empty" if password.nil?

      @login = login
      @password = password
    end
  end
end

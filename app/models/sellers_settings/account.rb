module SellersSettings
  class Account
    extend Dry::Initializer

    option :login, type: Dry::Types["strict.string"]
    option :password, type: Dry::Types["strict.string"]

    def ==(other)
      login == other.login && password == other.password
    end
    # attr_reader :login, :password

    # def initialize(login, password)
    #   raise StandardError "login can not be nil or empty" if login.nil?
    #   raise StandardError "password can not be nil or empty" if password.nil?

    #   @login = login
    #   @password = password
    # end
  end
end

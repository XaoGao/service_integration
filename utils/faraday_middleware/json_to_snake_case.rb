module FaradayMiddleware
  class JsonToSnakeCase < Faraday::Middleware
    def initialize(app)
      super(app)
      @app = app
    end

    def call(env)
      @app.call(env)
    end
  end
end

module FaradayMiddleware
  class JsonToSnakeCaseResponse < Faraday::Middleware
    def initialize(app)
      super(app)
      @app = app
    end

    def call(env)
      @app.call(env).on_complete do |response_env|
        # TODO: check response status and body is exist
        json_body = response_env.body

        body = JSON.parse(json_body).deep_transform_to_snake_case

        response_env.body = body
      end
    end
  end
end

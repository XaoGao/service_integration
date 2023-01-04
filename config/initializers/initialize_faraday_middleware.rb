module FaradayMiddleware
  autoload :JsonToSnakeCaseResponse, "#{Application.config.root_path}/utils/faraday_middleware/json_to_snake_case_response.rb"
  Faraday::Response.register_middleware json_to_snake_case_response: -> { JsonToSnakeCaseResponse }
end

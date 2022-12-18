class HttpServiceLoggerDecorator
  attr_reader :http_service

  def initialize(http_service)
    raise StandardError "http_service can not be nil" if http_service.nil?

    @http_service = http_service
  end

  def get(url:, params:, headers:)
    Application.logger.info "request >>> #{url} with #{params}"
    response = http_service.get(url, params, headers)
    Application.logger.info "response <<< #{url}; response #{response}"
    response
  end

  def post(url:, body:, params:, headers:)
    Application.logger.info "request >>> #{url} with #{params}"
    response = http_service.post(url, body, params, headers)
    Application.logger.info "response <<< #{url}; response #{response}"
    response
  end

  def put(url:, body:, params:, headers:)
    Application.logger.info "request >>> #{url} with #{params}"
    response = http_service.put(url, body, params, headers)
    Application.logger.info "response <<< #{url}; response #{response}"
    response
  end

  def delete(url:, body:, params:, headers:)
    Application.logger.info "request >>> #{url} with #{params}"
    response = http_service.delete(url, body, params, headers)
    Application.logger.info "response <<< #{url}; response #{response}"
    response
  end
end

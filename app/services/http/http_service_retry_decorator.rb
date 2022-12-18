class HttpServiceRetryDecorator
  attr_reader :http_service

  def initialize(http_service)
    raise StandardError "http_service can not be nil" if http_service.nil?

    @http_service = http_service
  end

  def get(url:, params:, headers:)
    attempts ||= 1

    http_service.get(url, params, headers)
  rescue StandardError => e
    Application.logger.error e.message

    if (attempts += 1) < 3
      Application.logger.info "<retrying..#{attempts}>"
      retry
    end

    Application.logger.info "-------------------------"
    Application.logger.info "Retry attempts exceeded. Moving on."
    raise
  end

  def post(url:, body:, params:, headers:)
    attempts ||= 1
    http_service.post(url, body, params, headers)
  rescue StandardError => e
    Application.logger.error e.message

    if (attempts += 1) < 3
      Application.logger.info "<retrying..#{attempts}>"
      retry
    end

    Application.logger.info "-------------------------"
    Application.logger.info "Retry attempts exceeded. Moving on."
    raise
  end

  def put(url:, body:, params:, headers:)
    attempts ||= 1
    http_service.put(url, body, params, headers)
  rescue StandardError => e
    Application.logger.error e.message

    if (attempts += 1) < 3
      Application.logger.info "<retrying..#{attempts}>"
      retry
    end

    Application.logger.info "-------------------------"
    Application.logger.info "Retry attempts exceeded. Moving on."
    raise
  end

  def delete(url:, body:, params:, headers:)
    attempts ||= 1
    http_service.delete(url, body, params, headers)
  rescue StandardError => e
    Application.logger.error e.message

    if (attempts += 1) < 3
      Application.logger.info "<retrying..#{attempts}>"
      retry
    end

    Application.logger.info "-------------------------"
    Application.logger.info "Retry attempts exceeded. Moving on."
    raise
  end
end

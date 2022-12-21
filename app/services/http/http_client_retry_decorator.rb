module Http
  class HttpClientRetryDecorator
    attr_reader :http_client

    def initialize(http_client)
      raise StandardError "http_client can not be nil" if http_client.nil?

      @http_client = http_client
    end

    def get(url:, params: {}, headers: {})
      attempts ||= 0

      http_client.get(url:, params:, headers:)
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

    def post(url:, body: nil, params: {}, headers: {})
      attempts ||= 1
      http_client.post(url:, body:, params:, headers:)
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

    def put(url:, body: nil, params: {}, headers: {})
      attempts ||= 1
      http_client.put(url:, body:, params:, headers:)
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

    def delete(url:, body: nil, params: {}, headers: {})
      attempts ||= 1
      http_client.delete(url:, body:, params:, headers:)
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
end

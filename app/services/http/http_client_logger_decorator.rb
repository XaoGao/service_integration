module Http
  class HttpClientLoggerDecorator
    attr_reader :http_client

    def initialize(http_client)
      raise StandardError "http_client can not be nil" if http_client.nil?

      @http_client = http_client
    end

    def get(url:, params: {}, headers: {})
      Application.logger.info "request >>> #{url} #{params.nil? ? "" : "with #{params}"}"
      response = http_client.get(url:, params:, headers:)
      Application.logger.info "response <<< #{url};\nStatus = #{response.status}\n#{response.body}"
      response
    end

    def post(url:, body: nil, params: {}, headers: {})
      Application.logger.info "request >>> #{url} #{params.nil? ? "" : "with #{params}"}"
      response = http_client.post(url:, body:, params:, headers:)
      Application.logger.info "response <<< #{url};\nStatus = #{response.status}\n#{response.body}"
      response
    end

    def put(url:, body: nil, params: {}, headers: {})
      Application.logger.info "request >>> #{url} #{params.nil? ? "" : "with #{params}"}"
      response = http_client.put(url:, body:, params:, headers:)
      Application.logger.info "response <<< #{url};\nStatus = #{response.status}\n#{response.body}"
      response
    end

    def delete(url:, body: nil, params: {}, headers: {})
      Application.logger.info "request >>> #{url} #{params.nil? ? "" : "with #{params}"}"
      response = http_client.delete(url:, body:, params:, headers:)
      Application.logger.info "response <<< #{url};\nStatus = #{response.status}\n#{response.body}"
      response
    end
  end
end

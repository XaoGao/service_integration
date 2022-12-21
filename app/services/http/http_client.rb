module Http
  class HttpClient
    def get(url:, params: {}, headers: {})
      conn = Faraday.new(
        url:,
        params:,
        headers: { "Content-Type" => "application/json" }.merge(headers)
      )

      conn.get
    end

    def post(url:, body: nil, params: {}, headers: {})
      conn = Faraday.new(
        url:,
        params:,
        headers: { "Content-Type" => "application/json" }.merge(headers)
      )

      conn.post do |req|
        req.body = body.to_json
      end
    end

    def put(url:, body: nil, params: {}, headers: {})
      conn = Faraday.new(
        url:,
        params:,
        headers: { "Content-Type" => "application/json" }.merge(headers)
      )

      conn.put do |req|
        req.body = body.to_json
      end
    end

    def delete(url:, body: nil, params: {}, headers: {})
      conn = Faraday.new(
        url:,
        params:,
        headers: { "Content-Type" => "application/json" }.merge(headers)
      )

      conn.delete do |req|
        req.body = body.to_json
      end
    end
  end
end

module Http
  class HttpClient
    def get(url:, params: {}, headers: {})
      conn = Faraday.new(
        url:,
        params:,
        headers: { "Content-Type" => "application/json" }.merge(headers)
      ) do |f|
        f.response :json_to_snake_case_response
      end

      conn.get
    end

    def post(url:, body: nil, params: {}, headers: {})
      conn = Faraday.new(
        url:,
        params:,
        headers: { "Content-Type" => "application/json" }.merge(headers)
      ) do |f|
        f.response :json_to_snake_case_response
      end

      conn.post do |req|
        req.body = body.to_json
      end
    end

    def put(url:, body: nil, params: {}, headers: {})
      conn = Faraday.new(
        url:,
        params:,
        headers: { "Content-Type" => "application/json" }.merge(headers)
      ) do |f|
        f.response :json_to_snake_case_response
      end

      conn.put do |req|
        req.body = body.to_json
      end
    end

    def delete(url:, body: nil, params: {}, headers: {})
      conn = Faraday.new(
        url:,
        params:,
        headers: { "Content-Type" => "application/json" }.merge(headers)
      ) do |f|
        f.response :json_to_snake_case_response
      end

      conn.delete do |req|
        req.body = body.to_json
      end
    end
  end
end

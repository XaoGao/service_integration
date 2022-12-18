class HttpService
  def get(url:, params:, headers:)
    conn = Faraday.new(
      url:,
      params:,
      headers: { "Content-Type" => "application/json" }.merge(headers)
    )

    conn.get
  end

  def post(url:, body:, params:, headers:)
    conn = Faraday.new(
      url:,
      params:,
      headers: { "Content-Type" => "application/json" }.merge(headers)
    )

    conn.post do |req|
      req.body = body.to_json
    end
  end

  def put(url:, body:, params:, headers:)
    conn = Faraday.new(
      url:,
      params:,
      headers: { "Content-Type" => "application/json" }.merge(headers)
    )

    conn.put do |req|
      req.body = body.to_json
    end
  end

  def delete(url:, body:, params:, headers:)
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

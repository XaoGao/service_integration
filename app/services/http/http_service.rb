module Http
  class HttpService
    include ::AutoInject["http_client"]

    include Dry::Monads[:maybe, :result]

    def get_catalog_categories(account)
      response = http_client.get(url: "#{ENV.fetch('B2B_URL')}/Api/GetCatalogCategories",
                                 params: { login: account.login, password: account.password, responseFormat: 1 })

      Failure(:unsuccess_http_status) unless response.success?

      handle_b2b_response(response_body: response.body)
    end

    def is_work_day(auth_header)
      response = http_client.get(url: "#{ENV.fetch('B2B_URL')}/api/isworkday",
                                 headers: auth_header)

      Failure(:unsuccess_http_status) unless response.success?

      Success(response.body)
    end

    def get_full_stock(account)
      response = http_client.get(url: "#{ENV.fetch('B2B_URL')}/Api/GetFullStock",
                                 params: { login: account.login, password: account.password, responseFormat: 1 })

      Failure(:unsuccess_http_status) unless response.success?

      handle_b2b_response(response_body: response.body)
    end

    def check_reserve_status(account)
      response = http_client.post(url: "#{ENV.fetch('B2B_URL')}/Api/CheckReserveStatus",
                                  params: { login: account.login, password: account.password, responseFormat: 1 })

      Failure(:unsuccess_http_status) unless response.success?

      handle_b2b_response(response_body: response.body)
    end

    private

    def handle_b2b_response(response_body:)
      maybe_code = Maybe(response_body).maybe { |body| body[:header] }.maybe { |header| header[:code] }

      case maybe_code
      in Some(code)
        code == 0 ? Success(json) : Failure(json[:header][:message])
      in None
        Failure(:unexpected_response)
      end
    end
  end
end

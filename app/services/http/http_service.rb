module Http
  class HttpService
    include ::AutoInject["http_client"]

    def get_catalog_categories(account)
      response = http_client.get(url: "http://localhost:4567/Api/GetCatalogCategories",
                      params: { login: account.login, password: account.password, responseFormat: 1 })

      raise StandardError "Запрос GetCatalogCategories вернулся с ошибкой" unless response.success?

      response
    end

    def is_work_day(auth_header)
      http_client.get(url: "http://localhost:4567/Api/IsWorkDay",
                      headers: auth_header)

      raise StandardError "Запрос IsWorkDay вернулся с ошибкой" unless response.success?

      response
    end

    def get_full_stock(account)
      http_client.get(url: "http://localhost:4567/Api/GetFullStock",
                      params: { login: account.login, password: account.password, responseFormat: 1 })

      raise StandardError "Запрос GetFullStock вернулся с ошибкой" unless response.success?

      response
    end
  end
end

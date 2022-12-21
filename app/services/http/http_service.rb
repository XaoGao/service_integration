module Http
  class HttpService
    include ::AutoInject["http_client"]

    def get_catalog_categories(account)
      http_client.get(url: "http://localhost:4567/Api/GetCatalogCategories",
                      params: { login: account.login, password: account.password, responseFormat: 1 })
    end
  end
end

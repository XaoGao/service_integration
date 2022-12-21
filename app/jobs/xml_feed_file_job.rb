class XmlFeedFileJob < AbstractJob
  include AutoInject["http_service"]

  def do_job(seller, merchant)
    account = Settings::Account.new(seller.b2b_auth.reserves.main_reserve_login,
                                    seller.b2b_auth.reserves.main_reserve_password)
    response = http_service.get_catalog_categories(account)
    Application.logger.info response.inspect
  end
end

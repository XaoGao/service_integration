class XmlFeedFileJob < AbstractJob
  include AutoInject["http_service"]

  def do_job(seller, merchant)
    account = seller.b2b_auth.reserves.account
    response = http_service.get_catalog_categories(account)
    Application.logger.info response.inspect
  end
end

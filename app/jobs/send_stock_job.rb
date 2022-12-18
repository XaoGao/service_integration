class SendStockJob < AbstractJob
  include AutoInject["http_service"]

  def do_job(seller, merchant)
    Application.logger.info "Do some jobs"
    Application.logger.info "Did some jobs"
  end
end

class SendStockJob < AbstractJob
  def do_job(seller, merchant)
    Application.logger.info "Do some jobs"
  end
end

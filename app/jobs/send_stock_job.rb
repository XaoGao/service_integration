class SendStockJob < AbstractJob
  include AutoInject["http_service"]

  def do_job(seller, merchant)
    if seller.tasks_settings.send_stock.off
      Application.logger.info "Передача цен и товарных остатков отключена"
      return
    end

    stock = get_stock(seller)

    if stock == null || !stock.Body.CategoryItems.Any
      Application.logger.info "get full stock вернул пустой массив"
      return
    end

    send_set_price(seller, stock) if seller.tasks_settings.send_stock.set_price

    send_set_amount(seller, stock) if seller.tasks_settings.send_stock.set_amount
  end

  private

  def send_set_amount(seller, stock)

  end

  def send_set_price(seller, stock)

  end

  def get_stock(seller)

  end

  def check_reserve_status

  end
end

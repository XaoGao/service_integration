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
    if seller.tasks_settings.send_stock.set_price
      work_day = http_service.is_work_day seller.header_for_work_day
      current_account = seller.account_by_interval work_day[:is_work_day]

      full_stock = send_get_full_stock current_account
      if seller.specify_quantity current_account
        check_response = send_check_reserve_status seller.account
        full_stock.update_amount check_response
      end

      return full_stock
    end
    send_get_full_stock seller.account
  end

  def check_reserve_status

  end
end

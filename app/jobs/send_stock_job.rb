class SendStockJob < AbstractJob
  include AutoInject["http_service", "mail_service"]

  def do_job(seller, _merchant)
    if seller.tasks_settings.send_stock.off
      Application.logger.info "Передача цен и товарных остатков отключена"
      return Success
    end
    stock_result = get_stock(seller)
    if stock_result.failure?
      return Failure("Прерывание алгоритма! GetFullStock вернулся с ошибкой: #{stock_result.failure}")
    end

    stock = stock_result.value!
    check_empty_response = empty_response(stock)
    return check_empty_response if check_empty_response.failure?

    send_set_price(seller, stock) if seller.tasks_settings.send_stock.set_price

    send_set_amount(seller, stock) if seller.tasks_settings.send_stock.set_amount
  end

  private

  def get_stock(seller)
    if seller.tasks_settings.send_stock.set_price
      work_day = http_service.is_work_day(seller.header_for_work_day)
      return work_day if work_day.failure?

      current_account = seller.account_by_interval(work_day.value![:is_work_day])

      full_stock = http_service.get_full_stock(seller.account.to_hash)
      return full_stock if full_stock.failure?

      if seller.specify_quantity(current_account)
        check_response = http_service.check_reserve_status(seller.account.to_hash)
        return check_response if check_response.failure?

        Some(update_amount(full_stock.value!, check_response.value!))
      end

      return full_stock
    end

    http_service.get_full_stock(seller.account)
  end

  def empty_response(stock)
    maybe_items = Maybe(stock).maybe { |s| s[:body] }.maybe { |body| body[:category_items] }
    if maybe_items.none? || maybe_items.value!.none?
      Failure("get full stock вернул пустой массив")
    else
      Success(true)
    end
  end

  def update_amount(stock, check_reserve_status)
    stock[:body][:category_items].each do |item|
      reserve_item = check_reserve_status[:body][:ware_items].find do |i|
        i[:ItemId] == item[:WareArticle] && (i[:ExternalId].nil? || i[:ExternalId].empty?)
      end
      item[:ReservedQty] = reserve_item.nil? ? reserve_item[:ReservedQty].to_s : "0"
    end
  end

  def send_set_amount(seller, stock); end

  def send_set_price(seller, stock); end
end

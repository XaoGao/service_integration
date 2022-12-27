class AbstractJob
  include Sidekiq::Job

  include Dry::Monads[:result]

  def perform(merchant_id, seller_name, task_name)
    raise ArgumentError "seller_name can not be nil" if seller_name.nil?
    raise ArgumentError "merchant_id can not be nil" if merchant_id.nil?

    merchant = Merchant.find(id: merchant_id)
    seller = SELLERS.find { |s| s.name == seller_name }
    begin
      Application.logger.info "#{merchant.name}: Запуск задачи #{task_name}."
      result = do_job seller, merchant
      if result.nil? || result.success?
        Application.logger.info "#{merchant.name}: Задача #{task_name} выполнена."
      else
        Application.logger.error "#{merchant.name}: Задача #{task_name} выполнена с ошибкой. #{result.failure}"
      end
    rescue StandardError => e
      Application.logger.error("#{merchant.name}: Ошибка во время выполнения #{task_name} задачи")
      Application.logger.error e.message
      Application.logger.error e.backtrace.join("\n")
    end
  end
end

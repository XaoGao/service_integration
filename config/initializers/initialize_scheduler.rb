merchants = Merchant.where(active: false)

merchants.each do |merchant|
  seller = SELLERS.find { |s| s.name == merchant.code }
  if seller.nil?
    Application.logger.warn "Для merchant = #{merchant.code} нет сопоставление из файла Sellers.xml!"
    next
  end

  # Test
  next unless seller.name == "5813"

  Sidekiq::Cron::Job.create(name: seller.tasks_settings.send_stock.name,
                            cron: seller.tasks_settings.send_stock.schedule,
                            class: seller.tasks_settings.send_stock.klass,
                            args: [merchant.id, seller.name,
                                   seller.tasks_settings.send_stock.name])
end

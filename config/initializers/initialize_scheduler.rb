merchants = Merchant.where(active: false)

merchants.each do |merchant|
  seller = SELLERS.find { |s| s.name == merchant.code }
  if seller.nil?
    Application.logger.warn "Для merchant = #{merchant.code} нет сопоставление из файла Sellers.xml!"
    next
  end
end

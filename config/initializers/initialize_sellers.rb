SELLERS = YAML.safe_load(
  File.read(File.expand_path("sellers.#{Application.config.env}.yml", Application.config.root_path)),
  symbolize_names: true
)[:seller].map do |seller|
  Settings::Seller.new(seller)
end

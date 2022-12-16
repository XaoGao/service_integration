SELLERS = YAML.safe_load(
  File.read(File.expand_path("sellers.#{Application.config.env}.yml", Application.root_path)),
  symbolize_names: true).map do |sq|
    Settings::Seller.new(sq.last.first)
  end

SELLERS = YAML.safe_load(
  File.read(File.expand_path("sellers.#{SI::Config.env}.yml", SI::Application.root_path)),
  symbolize_names: true).map do |sq|
    SI::Settings::Seller.new(sq.last.first)
  end

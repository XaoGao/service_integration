sellers = YAML.load_file(File.join(SI::Application.root_path, "sellers.#{SI::Config.env}.yml"))

sellers.each do |seller|
  puts seller.inspect
end

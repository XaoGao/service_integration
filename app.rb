require "sinatra"
require "debug"
require "yaml"

get "/" do
  "Hello world! \n" + SELLERS.to_s
end

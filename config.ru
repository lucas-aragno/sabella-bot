root = File.expand_path File.dirname(__FILE__)
require File.join(root, "app.rb")

app = Rack::Builder.app do
  run SabellaBot::App
end

run app

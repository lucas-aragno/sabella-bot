require "sinatra"
require "sinatra/namespace"
require "json"
#require "smarter_csv"
require "csv"
module SabellaBot
  class App < Sinatra::Base
    register Sinatra::Namespace

    namespace "/api" do
      before do
        content_type 'application/json'
      end

      get "/quote" do
        table = CSV.parse(File.read("test.csv"), liberal_parsing: {double_quote_outside_quote: true})
        sample = []

        while sample.empty? || !sample[2].include?("2014") || sample[-1].include?("@") do
          sample = table.sample
        end
        {message: sample[-1]}.to_json
      end
    end
  end
end

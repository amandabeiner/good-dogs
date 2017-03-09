require "rspec"
require "capybara/rspec"
require "csv"

require_relative "../server"

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before(:suite) do
    CSV.open('dogs.csv', 'w') { |file| file.puts(["name", "url"]) }
  end

  config.after(:each) do
    CSV.open('dogs.csv', 'w') { |file| file.puts(["name", "url"]) }
  end
end

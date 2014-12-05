require_relative '../lib/checkmate_ruby'

RSpec.configure do |config|
  config.before :each do
    Typhoeus::Expectation.clear
  end
end

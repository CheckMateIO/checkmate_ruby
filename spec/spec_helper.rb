require_relative '../lib/checkmate_ruby'
require 'webmock/rspec'
require 'vcr'

#VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'spec/checkmate_cassettes'
  c.hook_into :webmock
end

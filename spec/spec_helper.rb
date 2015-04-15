require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'vcr'
require 'factory_girl'


RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.mock_with :rspec
  config.filter_run(focus: true) unless ENV.fetch('NO_FOCUS',false)
  config.filter_run_excluding(slow: true) if ENV.fetch('NO_SLOW',false)
  config.run_all_when_everything_filtered = true

  config.use_transactional_fixtures = true
  DatabaseCleaner.strategy = :truncation

  config.before(:suite) do
    FactoryGirl.reload
    Rails.cache.clear
  end

  config.after(:suite) do
    DatabaseCleaner.clean
    Rails.cache.clear
  end

  config.around(:each, :skip_transactions => true) do |ex|
    self.use_transactional_fixtures = false
    DatabaseCleaner.strategy = :deletion
    DatabaseCleaner.start
    ex.run
    DatabaseCleaner.clean
  end
end


VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr/cassettes'
  c.default_cassette_options = {
    record: :new_episodes,
    re_record_interval: 3.months,
  }
  c.ignore_localhost = true
  c.configure_rspec_metadata! # allow us to use :vcr in the it/specify block
end

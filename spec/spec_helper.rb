RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  # config.profile_examples = 10

  config.order = :random
  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end

Dir.glob('./spec/support/*.rb').each do |support|
  load support
end

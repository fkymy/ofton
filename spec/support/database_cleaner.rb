Rspec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, {:except => %w{}}) # マスタ系など削除処理対象外
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

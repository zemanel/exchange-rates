# -*- encoding: utf-8 -*-

require "exchange_rate"
require "sequel"

RSpec.describe ExchangeRate do

  it "returns the exchange rate between two currencies" do
    #TODO
    expect(ExchangeRate.at(Time.now, "EUR", "USD")).to eq(1)
  end

  it "adds a currency rate to the database" do
    expect(ExchangeRate.add(Time.now, "EUR", 0.532)).to eq(1)
  end

  it "returns a list of available dates" do
    puts ExchangeRate.available_dates
    expect(ExchangeRate.available_dates.count).to be >= 1
  end

  it "returns a list of available currencies" do
    expect(ExchangeRate.available_currencies.count).to be >= 1
  end

end

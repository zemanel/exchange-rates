# -*- encoding: utf-8 -*-

module ExchangeRate

    require 'exchange_rate/database'
    require 'exchange_rate/import/xml'

    def ExchangeRate.at(time, from_currency, to_currency)
        #TODO
    end

    def ExchangeRate.add(time, currency, rate)
        Database.connection[:rates].insert(:date => time, :currency => currency, :rate => rate)
    end

    # Return a list of dates for which we have rates
    def ExchangeRate.available_dates
        Database.connection[:rates].distinct.select(:date).reverse_order(:date)
    end

    # Return a list of currencies for which we have rates
    def ExchangeRate.available_currencies
        Database.connection[:rates].distinct.select(:currency).order(:currency)
    end

end

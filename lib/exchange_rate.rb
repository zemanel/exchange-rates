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

end

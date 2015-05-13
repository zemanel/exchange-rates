# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'date'
require 'sinatra'
require 'sinatra/config_file'
require 'sinatra/reloader'


require 'exchange_rate'

set :bind, '0.0.0.0'

 
get '/' do
    @currencies = ExchangeRate.available_currencies.all
    @date = Date.today.strftime("%d-%m-%Y")
    @has_results = false

    if params.key?("date") && params.key?("from_currency") && params.key?("to_currency")
        @date = Date::strptime(params[:date], "%Y-%m-%d")
        @from_currency = params[:from_currency]
        @to_currency = params[:to_currency]
        @amount = params[:amount].to_f
        rate = ExchangeRate.at(@date, params[:from_currency], params[:to_currency])

        logger.info "Converting '#{@amount}' from #{@from_currency} to #{@to_currency} at rate #{rate}"

        @converted = @amount * rate

        @has_results = true
    end
    erb :index
end

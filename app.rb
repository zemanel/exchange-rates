# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'sinatra'
require 'sinatra/config_file'
require "sinatra/reloader"

require 'exchange_rate'

set :bind, '0.0.0.0'

 
get '/' do
    erb :index, :locals => {
        :currencies => ExchangeRate.available_currencies.all
    }
end

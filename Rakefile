# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "exchange_rate"

task :index do
    source = "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"
    XMLImporter.url_import(source)
end

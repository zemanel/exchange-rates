# -*- encoding: utf-8 -*-
require 'open-uri'
require 'nokogiri'
require 'exchange_rate'

module XMLImporter

  # Imports rates from an xml source into a [Sequel] database and
  # returns the number of imported rates
  def XMLImporter.url_import(source)
    doc = Nokogiri::HTML(open(source))
    count = 0
    docs = doc.xpath("//cube/cube[@time]")
    docs.each do |d|
      puts d[:time]
      d.children.each do |c|
        ExchangeRate.add(d[:time], c[:currency], c[:rate])
        count += 1
      end
    end
    return count
  end

end

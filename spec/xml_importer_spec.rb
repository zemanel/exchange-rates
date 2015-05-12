# -*- encoding: utf-8 -*-

require "exchange_rate/import/xml"
require "exchange_rate/database"
require "sequel"

RSpec.describe XMLImporter do
  it "parses an XML file and imports data into a database table" do
    source = "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"
    expect(XMLImporter.url_import(source)).to be > 0
  end

end

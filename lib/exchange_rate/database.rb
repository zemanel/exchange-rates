# -*- encoding: utf-8 -*-

require 'sequel'

module Database

    @connection = nil

    def Database.connection
        database_url = ENV["DATABASE_URL"]
        if database_url.nil?
            $stderr.puts "DATABASE_URL not set"
        end
        if @connection.nil?
            @connection = Sequel.connect(database_url)
        end
        return @connection
    end
end

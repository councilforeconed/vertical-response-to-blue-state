#!/usr/bin/env ruby

require 'csv'
require './lib/vertical-response'
require './lib/blue-state-headers'

Dir.glob('./vertical-response/*.csv').each do |file|
  output_file = File.new("./blue-state/#{file[20,file.length - 4]}-#{Time.new.strftime('%F-%3N%S')}.csv", 'w')
  output = CSV.new(output_file)
  output << HEADERS
  CSV.read(file, :headers => :first_row).each do |row|
    output << VerticalResponse.new(row).to_row
  end
end

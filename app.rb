#!/usr/bin/env ruby

require 'csv'
require 'sinatra'
require 'haml'
require './lib/vertical-response'
require './lib/blue-state-headers'

get "/" do
  haml :upload
end

post "/" do
  input = params[:file][:tempfile].read
  input = input.encode('utf-8')
  # input = input.gsub(/\r\n?/, '\n')
  CSV.read(input, headers: :first_row).each do |row|
    output << VerticalResponse.new(row).to_row
  end
  return output.to_s
end


# Dir.glob('./vertical-response/*.csv').each do |file|
#   output_file = File.new("./blue-state/#{file[20,file.length - 4]}-#{Time.new.strftime('%F-%3N%S')}.csv", 'w')
#   output = CSV.new(output_file)
#   output << HEADERS
#   CSV.read(file, headers: :first_row).each do |row|
#     output << VerticalResponse.new(row).to_row
#   end
# end

# File.open(params['file'][:filename], "w") do |f|
#   f.write(params['file'][:tempfile].read)
# end
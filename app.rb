#!/usr/bin/env ruby

require 'csv'
require 'sinatra'
require 'haml'
require './lib/vertical-response'
require './lib/blue-state-headers'

encoding_options = {
      :invalid => :replace,
      :undef => :replace,
      :replace => '?'
    }

get "/" do
  haml :upload
end

post "/" do
  content_type 'text/csv'
  input = params[:file][:tempfile].read.encode('UTF-8', encoding_options)
  output = Output.new
  CSV.parse(input, headers: :first_row).each do |row|
    output << VerticalResponse.new(row).to_s
  end
  return output.to_s
end

class Output
  
  def initialize
    @data = []
  end
  
  def <<(row)
    @data << row
  end
  
  def to_s
    @data.join("\n")
  end
  
end
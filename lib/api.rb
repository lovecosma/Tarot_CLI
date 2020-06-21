#!/usr/bin/env ruby
#!/usr/bin/env ruby
require 'pry'
require 'net/http'
require 'open-uri'
require 'json'
require_relative 'card.rb'
@@all = []

class Api
URL = ""
def initialize(url)
@url = url
@card_objects = []
end

def get_response_body
  @uri = URI.parse(@url)
  @response = Net::HTTP.get_response(@uri)
  @response.body
end

def parse_json
  @programs = JSON.parse(self.get_response_body)
return @programs
end

def create_cards
@card_hashes = self.parse_json["cards"]
@card_hashes.each do |card_hash|
@card_objects << Card.new(card_hash)
end
end

end

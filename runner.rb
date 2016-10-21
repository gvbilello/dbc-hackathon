require_relative 'view/view'
require_relative 'controller/controller'
require_relative 'model/historic_site'

# this library is best for making http requests
# and handling http responses:
require 'open-uri'

# this library is for handling json strings (parsing and creating):
require 'json'

# NYC Open Data: National Register of Historic Places :
BASE_URL = "https://data.ny.gov/resource/y36f-mkpp.json"

# query field for searching by county:
COUNTY_QUERY = "county="

# get user input (this would be a concern for your View)
puts "What county would you like to search?"
user_input = gets.chomp

# make http request to api endpoint for specific county,
# which will return a json string in http response:
json_string_response = open(BASE_URL + "?" + COUNTY_QUERY + user_input).read

# parse json string into Ruby hashes
ruby_hash_response = JSON.parse(json_string_response)

Controller.new(view: View, historic_site: HistoricSite, site_list: ruby_hash_response).run

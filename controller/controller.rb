require 'pry'
require 'JSON'

class Controller

  attr_reader :view, :historic_site,:site_list, :sites

  def initialize(args = {})
    @view = args.fetch(:view)
    @historic_site = args.fetch(:historic_site)
    @site_list = args.fetch(:site_list)
    @sites = args.fetch(:sites, Array.new)
  end

  def loader
    site_list.map do |site|
      historic_site.new(resource_name: site["resource_name"], national_register_date: site["national_register_date"][0..9], national_register_number: site["sphinx_number"], longitude: site["location_1"]["longitude"], latitude: site["location_1"]["latitude"])
    end
  end

  def display_sites
    view.display_historical_sites(sites)
  end

  def get_location_from_zip
    user_input = view.get_zip_code
    json_string_response = open("http://maps.googleapis.com/maps/api/geocode/json?address=" + user_input).read
    parsed_string = JSON.parse(json_string_response)

    latitude = parsed_string["results"][0]["geometry"]["location"]["lat"]
    longitude = parsed_string["results"][0]["geometry"]["location"]["lng"]
    # binding.pry
    return [latitude, longitude]
  end

  def distance_to_site

  end

  def run
    # binding.pry
    @sites = loader
    # display_sites
    p get_location_from_zip
  end

end

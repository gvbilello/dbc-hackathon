class HistoricSite

  attr_reader :resource_name, :county, :national_register_date, :national_register_number, :longitude, :latitude, :location_longitude, :location_latitude
  attr_accessor :distance

  def initialize(args = {})
    @resource_name = args.fetch(:resource_name, "")
    # @county = args.fetch(:county, "")
    @national_register_date = args.fetch(:national_register_date, "")
    @national_register_number = args.fetch(:national_register_number, "")
    @longitude = args.fetch(:longitude, 0).to_f
    @latitude = args.fetch(:latitude, 0).to_f
    # @location = args.fetch(:location)
    @location_longitude = args.fetch(:location_longitude, 0).to_f
    @location_latitude = args.fetch(:location_latitude, 0).to_f


    @distance = distance_in_meters(location_longitude, location_latitude)
  end

  def distance_in_meters(lng, lat)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (self.latitude - lat) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (self.longitude - lng) * rad_per_deg

    lat1_rad = lat * rad_per_deg
    lat2_rad = self.latitude * rad_per_deg

    lng1_rad = lng * rad_per_deg
    lng2_rad = self.longitude * rad_per_deg

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c # Delta in meters
  end

  def convert_to_miles
    (distance * 0.000621371).round(2)
  end

end

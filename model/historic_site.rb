class HistoricSite

  attr_reader :resource_name, :county, :national_register_date, :national_register_number, :longitude, :latitude, :location

  def initialize(args = {})
    @resource_name = args.fetch(:resource_name, "")
    # @county = args.fetch(:county, "")
    @national_register_date = args.fetch(:national_register_date, "")
    @national_register_number = args.fetch(:national_register_number, "")
    @longitude = args.fetch(:longitude, 0)
    @latitude = args.fetch(:latitude, 0)
    # @location = args.fetch(:location)
  end

  def distance

  end

end

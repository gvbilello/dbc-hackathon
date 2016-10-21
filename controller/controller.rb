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

  def run
    @sites = loader
    display_sites
  end

end

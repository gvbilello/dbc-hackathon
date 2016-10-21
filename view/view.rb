module View

  def self.display_historical_sites(sites)
    sites.each do |site|
      puts "#{site.resource_name}"
      puts "National Register Date: #{site.national_register_date}"
      puts "National Register Number: #{site.national_register_number}"
      puts "Location: (#{site.longitude}, #{site.latitude})"
      puts "--------------------"
    end
  end

  def self.get_zip_code
    puts "Please enter your zip code:"
    zip = gets.chomp
  end

end

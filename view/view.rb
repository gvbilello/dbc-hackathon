module View

  def self.display_historical_sites(sites)
    sites.each do |site|
      puts "#{site.resource_name}"
      puts "National Register Date: #{site.national_register_date}"
      puts "National Register Number: #{site.national_register_number}"
      puts "Location: (#{site.longitude}, #{site.latitude})"
      puts "Distance: #{site.distance} miles"
      puts "--------------------"
    end
  end

  def self.get_zip_code
    puts "Please enter your zip code:"
    zip = gets.chomp
  end

  def self.get_search_distance
    puts "Would you like sites within 1, 5, or 10 miles?"
    while true
      miles = gets.chomp.to_f
      if miles == 1.0 || miles == 5.0 || miles == 10.0
        return miles
        break
      end
      puts "Error: please input either 1, 5, or 10."
    end
  end

end

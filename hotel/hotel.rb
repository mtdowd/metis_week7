class Hotel
  attr_reader :hotel_name, :city, :phone, :singles, :doubles

  def initialize(hotel_name, city, phone, singles, doubles)
    @hotel_name = hotel_name
    @city = city
    @phone = phone
    @singles = singles
    @doubles = doubles
  end

  def hotel_basic_info
    puts "#{hotel_name}"
  end

  def hotel_full_info
    puts
    puts "Phone Number: #{phone}"
    puts "Location: #{city}"
    puts "Number of Rooms: #{singles + doubles}"
  end

end

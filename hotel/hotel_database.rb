require "./null_object"

class HotelDatabase
  attr_reader :hotels

  def initialize(hotels)
    @hotels = hotels
  end

  def search(query)
    hotels.find { |hotel| hotel.hotel_name == query } || NullHotel.new
  end
end

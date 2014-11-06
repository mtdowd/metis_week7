require "csv"
require "./hotel.rb"

class Directory
  attr_reader :file

  def initialize(file)
    @file = file
    @hotels = []
  end

  def run
    get_hotels(file)
    print_hotels
    get_hotel_query
    hotel_search
  end

  private

  def get_hotels(file)
    CSV.foreach(file, :headers => true, :header_converters => :symbol, :converters => :all) do |row|
      hotel_name = row[:hotel]
      city = row[:city]
      phone = row[:phone_number]
      singles = row[:number_of_singles]
      doubles = row[:number_of_doubles]
      @hotels << Hotel.new(hotel_name, city, phone, singles, doubles)
    end
  end

  def print_header
    puts
    header = "Hotel Listing"
    puts header
    puts "-" * header.length
  end

  def print_hotels
    print_header
    @hotels.each do |hotel|
      hotel.hotel_basic_info
    end
    puts
  end

  def get_hotel_query
    print "What property?: "
    @search_request = gets.chomp
  end

  def hotel_search
    query_response = query_search(@search_request)
    puts query_response.hotel_full_info
  end

  def query_search(query)
    return NullObject.new unless @hotels.find { |hotel| hotel.hotel_name == query }
  end

end

boston_hotels = Directory.new("hotels.csv")
boston_hotels.run

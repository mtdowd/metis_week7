require "csv"
require "./csv_reader"
require "./hotel"
require "./hotel_database"

class Directory
  attr_reader :file, :hotels, :hotel_query, :results

  def initialize(file)
    @file = file
    @hotels = []
  end

  def run
    get_hotels
    print_hotels
    loop do
      get_hotel_query
      hotel_search
      display_results
    end
  end

  private

  def get_hotels
    @hotels = CsvReader.new(file).load_hotels
  end

  def print_hotels
    print_header
    puts hotels
    puts
  end

  def print_header
    puts
    header = "Hotel Listing"
    puts header
    puts "-" * header.length
  end

  def get_hotel_query
    print "What property?: "
    @hotel_query = gets.chomp
  end

  def hotel_search
    @results = HotelDatabase.new(hotels).search(hotel_query)
  end

  def display_results
    puts results.hotel_full_info
  end

end

boston_hotels = Directory.new("hotels.csv")
boston_hotels.run

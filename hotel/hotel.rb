class Hotel
  attr_reader :hotel_name, :city, :phone, :singles, :doubles

  def initialize(row)
    @hotel_name = row[:hotel].strip
    @city = row[:city].strip
    @phone = format_phone_number(row[:phone_number])
    @singles = clean_number(row[:number_of_singles])
    @doubles = clean_number(row[:number_of_doubles])
  end

  def to_s
    hotel_name
  end

  def hotel_full_info
    puts
    puts "Phone Number: #{phone}"
    puts "Location: #{city}"
    puts "Number of Rooms: #{singles + doubles}"
  end

  def clean_number(number)
    number.strip.gsub(/[^\d]+/, "").to_i
  end

  def format_phone_number(number)
    cleaned_number = clean_number(number).to_s
    "(#{cleaned_number[0..2]}) #{cleaned_number[3..5]}-#{cleaned_number[6..9]}"
  end
end

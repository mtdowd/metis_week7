class CsvReader
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def load_hotels
    csv_reader { |row| Hotel.new(row) }
  end

  def csv_reader(&block)
    CSV.foreach(file, :headers => true, :header_converters => :symbol).map(&block)
  end

end

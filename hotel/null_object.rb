class NullObject

  def method_missing(*args, method_name)
    self
  end

  def hotel_full_info
    puts "No property found"
  end

end

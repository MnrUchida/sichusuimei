module BaseData
  def find_by(data)
    found_data = data.find(nil){|key, datum| yield datum}
    return found_data[1] unless found_data.nil?
    nil
  end

  def select_by(data)
    data.select{|key, datum| yield datum}
  end
end

module BaseData
  def by_code(code)
    find_by(@data){|datum|datum.code == code}
  end

  def by_key(find_key)
    @data[find_key]
  end

  def find_by(data)
    found_data = data.find(nil){|key, datum| yield datum}
    return found_data[1] unless found_data.nil?
    nil
  end

  def select_by(data)
    data.select{|key, datum| yield datum}
  end
end

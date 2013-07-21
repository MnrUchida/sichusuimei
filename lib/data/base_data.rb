module BaseData
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def instance
      @instance ||= self.new
    end
  end

  def init_data(klass)
    @data_name = klass.name.underscore
    @data = data_yaml["data"].inject(Hash.new) do |ret_data, (key, data)|
      ret_data[key] = klass.new(key, data)
      ret_data
    end

  end

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

  def data_yaml
    return @data_yaml if @data_yaml.present?
    @data_yaml = YAML.load_file("config/data/#{@data_name}.yml")
  end

  def methods_yaml
    return @methods_yaml if @methods_yaml.present?
    return unless File.exists?("config/data/methods/#{@data_name}.yml")
    @methods_yaml = YAML.load_file("config/data/methods/#{@data_name}.yml")
  end
end

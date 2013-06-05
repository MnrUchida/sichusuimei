require 'yaml'
require 'base_data'

class ZoukanData
  include BaseData

  @yaml_data = Hash.new

  def self.instance
    @instance ||= self.new
  end

  def initialize
    @yaml_data = YAML.load_file('config/data/zoukan.yml')
    @data = @yaml_data["ZOUKAN"].inject(Hash.new) do |ret_data, (key, data)|
      ret_data[key] = Zoukan.new(key, data)
      ret_data
    end
  end

  def by_angle(find_angle)
    find_by(@data) do |datum|
      datum.start_angle <= find_angle && datum.end_angle >= find_angle
    end
  end

end

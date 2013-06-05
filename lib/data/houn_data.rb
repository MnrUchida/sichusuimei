require 'yaml'
require 'base_data'

class HounData
  include BaseData

  @yaml_data = Hash.new

  def self.instance
    @instance ||= self.new
  end

  def initialize
    @yaml_data = YAML.load_file('config/data/houn.yml')
    @data = @yaml_data["HOUN"].inject(Hash.new) do |ret_data, (key, data)|
      ret_data[key] = Houn.new(key, data)
      ret_data
    end
  end

  def by_angle(find_angle)
    find_by(@data){|datum|datum.angle == find_angle}
  end

end

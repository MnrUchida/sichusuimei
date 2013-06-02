require 'yaml'
require 'base_data'

class JunishiData
  include BaseData

  @yaml_data = Hash.new

  def self.instance
    @instance ||= self.new
  end

  def initialize
    @yaml_data = YAML.load_file('config/data/junishi.yml')
    @data = @yaml_data[:JUNISHI.to_s].inject(Hash.new) do |ret_data, (key, data)|
      ret_data[key] = Junishi.new.load_data(key, data, @yaml_data[:ANGLE.to_s], @yaml_data[:METHOD.to_s])
      ret_data
    end
  end

  def by_code(code)
    find_by(@data){|datum|datum.code == code}
  end

  def by_key(find_key)
    find_by(@data){|datum|datum.key == find_key}
  end

  def by_id(id)
    find_by(@data){|datum|datum.id == id}
  end

  def by_angle(angle)
    find_by(@data){|datum|datum.angle == angle}
  end

end

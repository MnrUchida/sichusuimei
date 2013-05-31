require 'yaml'

class JunishiData
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

  def find_by_code(code)
    @data.find(nil){|key, data| data.code == code}[1]
  end

  def find_by_angle(angle)
    @data.find(nil){|key, data| data.angle == angle}[1]
  end

end

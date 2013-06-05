require 'yaml'
require 'base_data'

class JikkanData
  include BaseData

  @yaml_data = Hash.new

  def self.instance
    @instance ||= self.new
  end

  def initialize
    @yaml_data = YAML.load_file('config/data/jikkan.yml')
    @data = @yaml_data["JIKKAN"].inject(Hash.new) do |ret_data, (key, data)|
      ret_data[key] = Jikkan.load_data(key, data)
      ret_data
    end
  end

  def by_id(id)
    find_by(@data){|datum|datum.id == id}
  end

  def by_code(code)
    find_by(@data){|datum|datum.code == code}
  end

  def by_key(find_key)
    find_by(@data){|datum|datum.key == find_key}
  end

  def by_inyou(inyou)
    select_by(@data){|datum|datum.inyou == inyou}
  end

  def by_inyou_and_gogyo(inyou, gogyo_key)
    find_by(by_inyou(inyou)){|datum|datum.gogyo_key == gogyo_key}
  end
end

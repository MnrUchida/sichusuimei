require 'yaml'
require 'base_data'

class GogyoData
  include BaseData

  @yaml_data = Hash.new

  def self.instance
    @instance ||= self.new
  end

  def initialize
    @yaml_data = YAML.load_file('config/data/gogyo.yml')
    @data = @yaml_data["GOGYO"].inject(Hash.new) do |ret_data, (key, data)|
      ret_data[key] = Gogyo.load_data(key, data)
      ret_data
    end
  end

  def by_code(code)
    find_by(@data){|datum|datum.code == code}
  end

  def by_key(find_key)
    find_by(@data){|datum|datum.key == find_key}
  end
end

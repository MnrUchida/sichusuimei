require 'yaml'
require 'base_data'

class HentsuseiData
  include BaseData

  @yaml_data = Hash.new

  def self.instance
    @instance ||= self.new
  end

  def initialize
    @yaml_data = YAML.load_file('config/data/hentsusei.yml')
    @data = @yaml_data["HENTSUSEI"].inject(Hash.new) do |ret_data, (key, data)|
      ret_data[key] = Hentsusei.new(key, data)
      ret_data
    end
  end

  def by_inyou(inyou)
    select_by(@data){|datum|datum.inyou == inyou}
  end

  def by_inyou_and_category(inyou, category)
    find_by(by_inyou(inyou)){|datum|datum.category == category}
  end
end

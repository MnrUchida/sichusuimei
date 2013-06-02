require 'yaml'

class JunishiGogyoData

  @yaml_data = Hash.new

  def self.instance
    @instance ||= self.new
  end

  def initialize
    @yaml_data = YAML.load_file('config/data/junishi_gogyo.yml')
    @regular_data = gogyo_data(:regular)
    @doou_data = gogyo_data(:doou)
  end

  def regular_by_key(key)
    @regular_data[key]
  end

  def doou_by_key(key)
    @doou_data[key]
  end

  private
  def gogyo_data(pattern)
    @yaml_data["JUNISHI_GOGYO"][pattern.to_s].inject(Hash.new) do |ret_data, (key, data)|
      ret_data[key] = JunishiGogyo.load_data(key, data)
      ret_data
    end
  end
end

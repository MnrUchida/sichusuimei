require 'yaml'

class JunishiGogyoData
  include BaseData

  def initialize
    @data_name = 'junishi_gogyo'
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
    data_yaml["data"][pattern.to_s].inject(Hash.new) do |ret_data, (key, data)|
      ret_data[key] = JunishiGogyo.load_data(key, data)
      ret_data
    end
  end
end

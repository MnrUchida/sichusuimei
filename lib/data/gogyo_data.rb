require 'yaml'
require 'base_data'

class GogyoData
  include BaseData
  include RelationDefine

  def self.instance
    @instance ||= self.new
  end

  def initialize
    @data_name = 'gogyo'
    @data = data_yaml["data"].inject(Hash.new) do |ret_data, (key, data)|
      ret_data[key] = Gogyo.new(key, data)
      ret_data
    end

    def_methods_new
  end

  def angle_relation_angle_string(angle_relation)
    "(#{angle_relation}).revise"
  end

end

require 'yaml'
require 'base_data'

class GogyoData
  include BaseData
  include RelationDefine

  @yaml_data = Hash.new

  def self.instance
    @instance ||= self.new
  end

  def initialize
    @yaml_data = YAML.load_file('config/data/gogyo.yml')
    @data = @yaml_data["GOGYO"].inject(Hash.new) do |ret_data, (key, data)|
      ret_data[key] = Gogyo.new(key, data)
      ret_data
    end

    def_method_relation(@yaml_data[:METHOD.to_s]){|define, name| method_relation_string(define, name)}
    def_method_relation(@yaml_data[:ANGLE.to_s]){|define, name| angle_relation_string(define, name)}
  end

  def angle_relation_angle_string(angle_relation)
    "(#{angle_relation}).revise"
  end

end

require 'yaml'
require 'base_data'
require 'relation_define'

class JikkanData
  include BaseData
  include RelationDefine

  @yaml_data = Hash.new

  def self.instance
    @instance ||= self.new
  end

  def initialize
    @yaml_data = YAML.load_file('config/data/jikkan.yml')
    @data = @yaml_data["JIKKAN"].inject(Hash.new) do |ret_data, (key, data)|
      ret_data[key] = Jikkan.new(key, data)
      ret_data
    end

    def_method_relation(@yaml_data[:ANGLE.to_s]){|define, name| angle_relation_string(define, name)}
    def_method_relation(@yaml_data[:METHOD.to_s]){|define, name| method_relation_string(define, name)}
  end

  def by_id(id)
    find_by(@data){|datum|datum.id == id}
  end

  def by_inyou(inyou)
    select_by(@data){|datum|datum.inyou == inyou}
  end

  def by_inyou_and_gogyo(inyou, gogyo_key)
    find_by(by_inyou(inyou)){|datum|datum.gogyo_key == gogyo_key}
  end

  def angle_relation_angle_string(angle_relation)
    "revise_angle(#{angle_relation})"
  end

end

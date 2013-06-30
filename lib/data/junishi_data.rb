require 'yaml'
require 'base_data'
require 'relation_define'

class JunishiData
  include BaseData
  include RelationDefine

  @yaml_data = Hash.new

  def self.instance
    @instance ||= self.new
  end

  def initialize
    @yaml_data = YAML.load_file('config/data/junishi.yml')
    @data = @yaml_data[:JUNISHI.to_s].inject(Hash.new) do |ret_data, (key, data)|
      ret_data[key] = Junishi.new(key, data)
      ret_data
    end

    def_method_relation(@yaml_data[:ANGLE.to_s]){|define, name| angle_relation_string(define, name)}
    def_method_relation(@yaml_data[:METHOD.to_s]){|define, name| method_relation_string(define, name)}
    def_method_relation(@yaml_data[:METHOD_JIKKAN.to_s]){|define, name| jikkan_relation_string(define, name)}
  end

  def by_id(id)
    find_by(@data){|datum|datum.id == id}
  end

  def by_angle(angle)
    find_by(@data){|datum|datum.angle == angle}
  end

  private
  def angle_relation_angle_string(angle_relation)
    <<-EOS
      return if (#{angle_relation}).nil?
      (#{angle_relation}).in_circle
    EOS
  end

end

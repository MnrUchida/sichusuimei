require 'yaml'
require 'base_data'
require 'relation_define'

class JunishiData
  include BaseData
  include RelationDefine

  def initialize
    init_data(Junishi)

    def_methods_new
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

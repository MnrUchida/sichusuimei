require 'yaml'
require 'base_data'
require 'relation_define'

class JikkanData
  include BaseData
  include RelationDefine

  def initialize
    init_data(Jikkan)

    def_methods_new
  end

  def by_id(id)
    find_by(@data){|datum|datum.id == id}
  end

  def by_inyou(inyou)
    select_by(@data){|datum|datum.inyou == inyou}
  end

  def by_inyou_and_gogyo(inyou, gogyo_key)
    find_by(by_inyou(inyou)){|datum|datum.gogyo_key == gogyo_key.to_s}
  end

  def angle_relation_angle_string(angle_relation)
    "(#{angle_relation}).revise"
  end

end

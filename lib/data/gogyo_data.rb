require 'yaml'
require 'base_data'

class GogyoData
  include BaseData
  include RelationDefine

  def initialize
    init_data(Gogyo)

    def_methods
  end

  def angle_relation_angle_string(angle_relation)
    "(#{angle_relation}).revise"
  end

end

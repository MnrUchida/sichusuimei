require 'yaml'
require 'base_data'

class HounData
  include BaseData

  def initialize
    init_data(Houn)
  end

  def by_angle(find_angle)
    find_by(@data){|datum|datum.angle == find_angle}
  end
end

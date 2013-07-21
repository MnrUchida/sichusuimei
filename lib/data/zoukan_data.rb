require 'yaml'
require 'base_data'

class ZoukanData
  include BaseData

  def initialize
    init_data(Zoukan)
  end

  def by_angle(find_angle)
    find_by(@data) do |datum|
      datum.start_angle <= find_angle && datum.end_angle >= find_angle
    end
  end

end

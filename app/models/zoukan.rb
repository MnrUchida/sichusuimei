class Zoukan < ActiveRecord::Base
  attr_accessible :jikkan_code, :start_angle, :span_angle

  def self.by_angle(angle)
    self.where("start_angle <= :angle and (start_angle + span_angle - 1) >= :angle ", {:angle => angle}).first
  end

  def jikkan()
    Jikkan.find_by_code(self.jikkan_code)
  end

end

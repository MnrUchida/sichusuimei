class Zoukan < ActiveRecord::Base
  attr_accessible :jikkan_code, :start_angle, :span_angle

  belongs_to :jikkan, :foreign_key => "jikkan_code", :primary_key => "code"

  def self.by_angle(angle)
    self.where("start_angle <= :angle and (start_angle + span_angle - 1) >= :angle ", {:angle => angle}).first
  end
end

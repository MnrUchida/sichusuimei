class JunishiGogyo < ActiveRecord::Base
  attr_accessible :gogyo_id, :junishi_code, :point, :point_month, :doseishi

  belongs_to :gogyo, :foreign_key => "gogyo_id",:class_name => 'Gogyo'

  def code
    gogyo.code
  end
end

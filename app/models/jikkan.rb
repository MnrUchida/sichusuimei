class Jikkan < ActiveRecord::Base
  JIKKAN_COUNT = 10

  attr_accessible :type, :inyou, :code, :name, :point, :point_day, :gogyo_id, :shi_teiou

  belongs_to :gogyo, :foreign_key => "gogyo_id",:class_name => 'Gogyo'

  def hentsusei(relate_jikkan)
    Hentsusei.where(:category => self.gogyo.relation_with_gogyo(relate_jikkan.gogyo),
                    :inyou => relate_jikkan.inyou * self.inyou).first
  end

  def houn(relate_junishi)
    Houn.where(:angle => houn_angle(relate_junishi)).first
  end

  def houn_angle(relate_junishi)
    ((relate_junishi.angle - self.gogyo.angle) * self.inyou) % 360
  end
end

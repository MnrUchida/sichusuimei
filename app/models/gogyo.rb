class Gogyo < ActiveRecord::Base
  GOGYO_COUNT = 5
  COLOR = ["blue", "red", "yellow", "white", "black"]

  SHIDAI = [4,3,1,0]

  attr_accessible :code, :name, :angle

  has_many :jikkan

  def color
    COLOR[self.code]
  end

  def relation_with_gogyo(relate_gogyo)
    (relate_gogyo.code - self.code) % Gogyo::GOGYO_COUNT
  end

  def self.shidai(code)
    self.where(:code => SHIDAI[code]).first
  end

  def in_kan
    kan("inyou.in")
  end

  def you_kan
    kan("inyou.you")
  end

  private
  def kan(inyou)
    self.jikkan.where(:inyou => SelectParameters.get_value(inyou)).first
  end

end

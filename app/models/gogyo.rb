class Gogyo < ActiveRecord::Base
  GOGYO_COUNT = 5

  attr_accessible :code, :name, :angle

  has_many :jikkan

  def relation_with_gogyo(relate_gogyo)
    (relate_gogyo.code - self.code) % Gogyo::GOGYO_COUNT
  end
end

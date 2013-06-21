require 'angle'

class Gogyo
  include Angle

  GOGYO_COUNT = 5
  SHIDAI = [4,3,1,0]

  attr_reader :key, :color, :code, :name, :angle

  def initialize(key, data)
    @key = key
    @code = data["code"]
    @name = data["name"]
    @angle = data["angle"]
    @color = data["color"]
  end

  def +(value)
    Gogyo.by_code( (self.code + value) % GOGYO_COUNT)
  end

  def relation_with_gogyo(relate_gogyo)
    (relate_gogyo.code - self.code) % GOGYO_COUNT
  end

  def self.shidai(code)
    self.by_code(SHIDAI[code])
  end

  def self.by_key(key)
    GogyoData.instance.by_key(key)
  end

  def self.by_code(code)
    GogyoData.instance.by_code(code)
  end

  def in_kan
    kan("inyou.in")
  end

  def you_kan
    kan("inyou.you")
  end

  def pos_x
    sign_pos * abs_pos_x
  end

  def pos_y
    sign_pos * abs_pos_y
  end

  private
  def kan(inyou)
    Jikkan.by_inyou_and_gogyo(SelectParameters.get_value(inyou), self.key )
  end

  def abs_pos_x
    ((angle + ANGLE_SHI) % ANGLE_HALF_CIRCLE) / ANGLE_RIGHT
  end

  def abs_pos_y
    ((angle + ANGLE_SHI + ANGLE_RIGHT) % ANGLE_HALF_CIRCLE) / ANGLE_RIGHT
  end

  def sign_pos
    (angle + ANGLE_SHI - ANGLE_HALF_CIRCLE) <= 0 ? 1 : -1
  end
end

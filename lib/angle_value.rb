class AngleValue
  SHI_COUNT = 12
  ANGLE_CIRCLE = 360
  ANGLE_HALF_CIRCLE = ANGLE_CIRCLE / 2
  ANGLE_RIGHT = ANGLE_CIRCLE / 4
  ANGLE_SHI = ANGLE_CIRCLE / SHI_COUNT
  ANGLE_HALF_SHI = ANGLE_SHI / 2
  ANGLE_DOUBLE_SHI = ANGLE_SHI * 2

  def initialize(value = 0)
    @value = value
  end

  def to_i
    @value
  end

  def in_circle
    AngleValue.new(@value % ANGLE_CIRCLE)
  end

  def +(value)
    AngleValue.new(@value + value.to_i)
  end

  def -(value)
    AngleValue.new(@value - value.to_i)
  end

  def *(value)
    AngleValue.new(@value * value.to_i)
  end

  def div(value)
    AngleValue.new(@value.div(value))
  end

  def %(value)
    AngleValue.new(@value % value)
  end

  def revise
    (self - ANGLE_HALF_SHI).in_circle
  end

  def original
    (self + ANGLE_HALF_SHI).in_circle
  end

  def four_season
    (self - ANGLE_DOUBLE_SHI).original.div(ANGLE_RIGHT)
  end

  def two_season
    four_season.div(2)
  end

  def multi_shi(value)
    self * (value * ANGLE_SHI)
  end

  def with_shi(value, &proc)
    proc ||= Proc.new{|angle| return angle}

    proc.call self + (value * ANGLE_SHI)
  end

  def mod_shi(value)
    self % (value * ANGLE_SHI)
  end
end

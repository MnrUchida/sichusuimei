module Angle
  SHI_COUNT = 12
  ANGLE_CIRCLE = 360
  ANGLE_HALF_CIRCLE = ANGLE_CIRCLE / 2
  ANGLE_RIGHT = ANGLE_CIRCLE / 4
  ANGLE_SHI = ANGLE_CIRCLE / SHI_COUNT
  ANGLE_HALF_SHI = ANGLE_SHI / 2
  ANGLE_DOUBLE_SHI = ANGLE_SHI * 2
  GOGYO_DO = 3

  def revise_angle(angle)
    (angle - ANGLE_HALF_SHI) % ANGLE_CIRCLE
  end

  def original_angle(angle)
    (angle + ANGLE_HALF_SHI) % ANGLE_CIRCLE
  end

  def four_season_by_angle(angle)
    original_angle(angle - ANGLE_DOUBLE_SHI).div(ANGLE_RIGHT)
  end

  def two_season_by_angle(angle)
    four_season_by_angle(angle).div(2)
  end
end

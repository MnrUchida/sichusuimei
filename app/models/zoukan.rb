class Zoukan
  attr_reader :key, :jikkan_key, :start_angle, :span_angle

  def initialize(key, data)
    @key = key
    @jikkan_key = data["jikkan_key"]
    @start_angle = data["start_angle"]
    @span_angle = data["span_angle"]
  end

  def self.by_angle(angle)
    ZoukanData.instance.by_angle(angle)
  end

  def end_angle
    self.start_angle + self.span_angle - 1
  end

  def jikkan()
    Jikkan.by_key(self.jikkan_key)
  end

end

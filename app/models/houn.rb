class Houn
  include Angle

  attr_reader :key, :code, :name, :point, :angle

  def self.by_key(key)
    HounData.instance.by_key(key)
  end

  def self.by_angle(angle)
    HounData.instance.by_angle(angle)
  end

  def initialize(key, data)
    @key = key
    @code = data["code"]
    @name = data["name"]
    @point = data["point"]
    @angle = data["angle"]
  end

  def construct_junishi_with(jikkan)
    Junishi.by_angle((self.angle / jikkan.inyou + jikkan.gogyo.angle) % ANGLE_CIRCLE )
  end
end

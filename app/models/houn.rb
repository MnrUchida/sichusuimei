class Houn

  attr_reader :key, :code, :name, :point

  def self.by_key(key)
    HounData.instance.by_key(key)
  end

  def self.by_angle(angle)
    HounData.instance.by_angle(angle.to_i)
  end

  def initialize(key, data)
    @key = key
    @code = data["code"]
    @name = data["name"]
    @point = data["point"]
    @angle = AngleValue.new(data["angle"])
  end

  def angle
    @angle.to_i
  end

  def construct_junishi_with(jikkan)
    Junishi.by_angle( (@angle * jikkan.inyou + jikkan.gogyo.angle).in_circle )
  end
end

class Houn
  attr_reader :key, :code, :name, :point, :angle

  def self.load_data(key, data)
    Houn.new(key,data)
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
end

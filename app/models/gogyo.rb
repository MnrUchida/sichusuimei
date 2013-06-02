class Gogyo
  GOGYO_COUNT = 5
  SHIDAI = [4,3,1,0]

  attr_accessor :key, :color, :code, :name, :angle

  def self.load_data(key, data)
    gogyo = Gogyo.new
    gogyo.key = key
    gogyo.code = data["code"]
    gogyo.name = data["name"]
    gogyo.angle = data["angle"]
    gogyo.color = data["color"]
    gogyo
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

  private
  def kan(inyou)
    Jikkan.by_inyou_and_gogyo(SelectParameters.get_value(inyou), self.key )
  end
end

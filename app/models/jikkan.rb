require 'angle'

class Jikkan
  include Angle

  JIKKAN_COUNT = 10

  attr_reader :inyou, :code, :name, :point, :point_day, :key, :gogyo_key, :id

  def initialize(key, data)
    @key = key
    @inyou = data["member"]["inyou"]
    @code = data["member"]["code"]
    @id = @code + 1
    @name = data["member"]["name"]
    @point = data["member"]["point"]
    @point_day = data["member"]["point_day"]
    @gogyo_key = data["member"]["gogyo_key"]
  end

  def self.by_code(code)
    JikkanData.instance.by_code(code)
  end

  def self.by_key(key)
    JikkanData.instance.by_key(key)
  end

  def self.by_inyou(inyou)
    JikkanData.instance.by_inyou(inyou)
  end

  def self.by_inyou_and_gogyo(inyou, gogyo_key)
    JikkanData.instance.by_inyou_and_gogyo(inyou, gogyo_key)
  end

  def self.by_id(id)
    JikkanData.instance.by_id(id)
  end

  def gou
    Jikkan.by_code(gou_code)
  end

  def gou?(relate_jikkan)
    relate_jikkan.code == gou_code
  end

  def hentsusei(relate_jikkan)
    Hentsusei.by_inyou_and_category(relate_jikkan.inyou * self.inyou,
        self.gogyo.relation_with_gogyo(relate_jikkan.gogyo))
  end

  def houn(relate_junishi)
    Houn.by_angle(houn_angle(relate_junishi))
  end

  def houn_angle(relate_junishi)
    (AngleValue.new(relate_junishi.angle - self.gogyo.angle) * self.inyou).in_circle
  end

  def gogyo
    Gogyo.by_key(self.gogyo_key)
  end

  private
  def gou_code
    (self.code + JIKKAN_COUNT / 2) % JIKKAN_COUNT
  end
end

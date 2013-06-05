class Jikkan
  JIKKAN_COUNT = 10

  attr_reader :inyou, :code, :name, :point, :point_day, :gogyo_id, :key, :gogyo_key, :id

  def initialize(key, data)
    @key = key
    @inyou = data["inyou"]
    @code = data["code"]
    @id = @code + 1
    @name = data["name"]
    @point = data["point"]
    @point_day = data["point_day"]
    @gogyo_key = data["gogyo_key"]
  end

  def self.find_by_code(code)
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
    Jikkan.find_by_code(self.gou_code)
  end

  def gou?(relate_jikkan)
    relate_jikkan.code == self.gou_code
  end

  def hentsusei(relate_jikkan)
    Hentsusei.by_inyou_and_category(relate_jikkan.inyou * self.inyou,
        self.gogyo.relation_with_gogyo(relate_jikkan.gogyo))
  end

  def houn(relate_junishi)
    Houn.by_angle(houn_angle(relate_junishi))
  end

  def houn_angle(relate_junishi)
    ((relate_junishi.angle - self.gogyo.angle) * self.inyou) % 360
  end

  def gogyo
    Gogyo.by_key(self.gogyo_key)
  end

  protected
  def gou_code
    (self.code + JIKKAN_COUNT / 2) % JIKKAN_COUNT
  end
end

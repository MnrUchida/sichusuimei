class Hentsusei
  attr_reader :key, :code, :name, :point, :category, :inyou

  def initialize(key, data)
    @key = key
    @inyou = data["inyou"]
    @code = data["code"]
    @name = data["name"]
    @point = data["point"]
    @category = data["category"]
  end

  def self.by_key(key)
    HentsuseiData.instance.by_key(key)
  end

  def self.by_inyou(inyou)
    HentsuseiData.instance.by_inyou(inyou)
  end

  def self.by_inyou_and_category(inyou, category)
    HentsuseiData.instance.by_inyou_and_category(inyou, category)
  end

  def construct_other_with(jikkan)
    Jikkan.by_inyou_and_gogyo(jikkan.inyou * self.inyou, (jikkan.gogyo + self.category).key)
  end
end

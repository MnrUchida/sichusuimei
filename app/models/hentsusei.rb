class Hentsusei
  attr_accessor :key, :code, :name, :point, :category, :inyou

  def self.load_data(key, data)
    hentsusei = Hentsusei.new
    hentsusei.key = key
    hentsusei.inyou = data["inyou"]
    hentsusei.code = data["code"]
    hentsusei.name = data["name"]
    hentsusei.point = data["point"]
    hentsusei.category = data["category"]
    hentsusei
  end

  def self.by_inyou(inyou)
    HentsuseiData.instance.by_inyou(inyou)
  end

  def self.by_inyou_and_category(inyou, category)
    HentsuseiData.instance.by_inyou_and_category(inyou, category)
  end

end

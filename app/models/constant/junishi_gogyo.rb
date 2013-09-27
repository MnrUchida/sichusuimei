class JunishiGogyo
  attr_reader :key, :gogyo_key, :point, :point_month

  def code
    gogyo.code
  end

  def initialize(key, data)
    @key = key
    @gogyo_key = data["gogyo"]
    @point = data["point"]
    @point_month = data["point_month"]
  end

  def self.load_data(key, data)
    data.map do |datum|
      JunishiGogyo.new(key,datum)
    end
  end

  def self.regular_by_key(key)
    JunishiGogyoData.instance.regular_by_key(key)
  end

  def self.doou_by_key(key)
    JunishiGogyoData.instance.doou_by_key(key)
  end

  private
  def gogyo
    Gogyo.by_key(self.gogyo_key)
  end
end
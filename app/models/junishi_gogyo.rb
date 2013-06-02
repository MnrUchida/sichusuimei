class JunishiGogyo
  attr_accessor :key, :gogyo_key, :gogyo_id, :junishi_code, :point, :point_month, :doseishi

  def code
    gogyo.code
  end

  def self.load_data(key, data)
    data.map do |datum|
      junishi_gogyo = JunishiGogyo.new
      junishi_gogyo.key = key
      junishi_gogyo.gogyo_key = datum["gogyo"]
      junishi_gogyo.point = datum["point"]
      junishi_gogyo.point_month = datum["point_month"]
      junishi_gogyo
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
class Junishi
  SHI_COUNT = 12

  attr_reader :key, :relation, :id, :code, :name

  def initialize(key, data)
    @key = key
    @code = data["member"]["code"]
    @id = @code.to_i + 1
    @name = data["member"]["name"]
    @angle = AngleValue.new(data["member"]["angle"])
  end

  def angle
    @angle.to_i
  end

  def angle_value
    @angle
  end

  def self.by_key(key)
    JunishiData.instance.by_key(key)
  end

  def self.by_angle(angle)
    JunishiData.instance.by_angle(angle.to_i)
  end

  def self.by_code(code)
    JunishiData.instance.by_code(code)
  end

  def self.find_by_id(id)
    JunishiData.instance.by_id(id)
  end

  def +(value)
    Junishi.by_code((self.code + value) % SHI_COUNT)
  end

  def -(value)
    self.+(-value)
  end

  def to_hour
    self.code * 2
  end

  def zoukan(day)
    Zoukan.by_angle(angle + day_angle(day)).jikkan
  end

  def day_angle(day)
    return AngleValue::ANGLE_SHI - 1 if day >= AngleValue::ANGLE_SHI
    day
  end

  def gogyo(day)
    if doou?(day)
      JunishiGogyo.doou_by_key(self.key)
    else
      JunishiGogyo.regular_by_key(self.key)
    end
  end

  private

  def doou?(day)
    return false unless @angle.with_shi(-0.5).mod_shi(3).to_i == 0

    zoukan(day).gogyo_key == 'tsuchi'
  end

end

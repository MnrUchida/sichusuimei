class Junishi

  SHI_COUNT = 12
  ANGLE_CIRCLE = 360
  ANGLE_HALF_CIRCLE = ANGLE_CIRCLE / 2
  ANGLE_RIGHT = ANGLE_CIRCLE / 4
  ANGLE_SHI = ANGLE_CIRCLE / SHI_COUNT
  ANGLE_HALF_SHI = ANGLE_SHI / 2
  ANGLE_DOUBLE_SHI = ANGLE_SHI * 2
  GOGYO_DO = 3

  attr_reader :key, :relation, :id, :code, :name, :angle

  def initialize(key, data, angle_relation, method_relation)
    @key = key
    @relation = data["relation"]
    @code = data["member"]["code"]
    @id = @code.to_i + 1
    @name = data["member"]["name"]
    @angle = data["member"]["angle"]
    def_angle_relation(angle_relation)
    def_method_relation(method_relation)
  end

  def self.by_angle(angle)
    JunishiData.instance.by_angle(angle)
  end

  def self.find_by_code(code)
    JunishiData.instance.by_code(code)
  end

  def self.find_by_id(id)
    JunishiData.instance.by_id(id)
  end

  def +(value)
    Junishi.find_by_code((self.code + value) % SHI_COUNT)
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
    return ANGLE_SHI - 1 if day >= ANGLE_SHI
    day
  end

  def gogyo(day)
    if doou?(day)
      JunishiGogyo.doou_by_key(self.key)
    else
      JunishiGogyo.regular_by_key(self.key)
    end
  end

  def def_angle_relation(angle_relation)
    angle_relation.each do |method_name, relation|
      self.instance_eval angle_relation_string(relation, method_name)
    end
  end

  def def_method_relation(method_relation)
    method_relation.each do |method_name, relation|
      self.instance_eval method_relation_string(relation, method_name)
    end
  end

  protected

  def doou?(day)
    return false if (self.angle - ANGLE_HALF_SHI) % ANGLE_RIGHT

    zoukan(day).gogyo_id == GOGYO_DO
  end

  def method_relation_string(method_relation, method_name)
    <<-EOS
        def #{method_name.to_s}(target = nil)
          #{method_relation_no_method_string(method_relation, method_name)}
        end
    EOS
  end

  def method_relation_no_method_string(method_relation, method_name)
    if relation.key?(method_name.to_s)
      <<-EOS
        #{method_relation["method"][relation[method_name.to_s]]}
      EOS
    end
  end

  def angle_relation_string(angle_relation, method_name)
    <<-EOS
      def #{method_name.to_s}_angle
        #{angle_relation_angle_string(angle_relation, method_name)}
      end

      def #{method_name.to_s}
        Junishi.by_angle(#{method_name.to_s}_angle)
      end

      def #{method_name.to_s}?(relate_junishi)
        relate_junishi.angle == #{method_name.to_s}_angle
      end
    EOS
  end

  def angle_relation_angle_string(angle_relation, method_name)
    if relation.key?(method_name.to_s)
      <<-EOS
        (#{angle_relation["method"][relation[method_name.to_s]]}) % ANGLE_CIRCLE
      EOS
    end
  end
end

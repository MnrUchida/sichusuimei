require 'angle'

class Jikkan
  include Angle

  JIKKAN_COUNT = 10

  attr_reader :inyou, :code, :name, :point, :point_day, :gogyo_id, :key, :gogyo_key, :relation, :id

  def initialize(key, data, angle_relation, method_relation)
    @key = key
    @relation = data["relation"] || {}
    @inyou = data["member"]["inyou"]
    @code = data["member"]["code"]
    @id = @code + 1
    @name = data["member"]["name"]
    @point = data["member"]["point"]
    @point_day = data["member"]["point_day"]
    @gogyo_key = data["member"]["gogyo_key"]

    def_junishi_angle_relation(angle_relation)
    def_method_relation(method_relation)
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
    ((relate_junishi.angle - self.gogyo.angle) * self.inyou) % ANGLE_CIRCLE
  end

  def gogyo
    Gogyo.by_key(self.gogyo_key)
  end

  def def_junishi_angle_relation(angle_relation)
    angle_relation.each do |method_name, relation|
      self.instance_eval angle_relation_string(relation, method_name)
    end
  end

  def def_method_relation(method_relation)
    return if method_relation.nil?
    method_relation.each do |method_name, relation|
      self.instance_eval method_relation_string(relation, method_name)
    end
  end

  protected
  def gou_code
    (self.code + JIKKAN_COUNT / 2) % JIKKAN_COUNT
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
        revise_angle(#{angle_relation["method"][relation[method_name.to_s]]})
      EOS
    end
  end

end

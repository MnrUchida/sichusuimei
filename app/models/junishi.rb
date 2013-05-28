class Junishi < ActiveRecord::Base
  after_initialize :def_angle_relation
  after_initialize :def_method_relation

  SHI_COUNT = 12
  ANGLE_CIRCLE = 360
  ANGLE_HALF_CIRCLE = ANGLE_CIRCLE / 2
  ANGLE_RIGHT = ANGLE_CIRCLE / 4
  ANGLE_SHI = ANGLE_CIRCLE / SHI_COUNT
  ANGLE_HALF_SHI = ANGLE_SHI / 2
  ANGLE_DOUBLE_SHI = ANGLE_SHI * 2
  GOGYO_DO = 3

  attr_accessible :code, :name, :angle
  
  has_many :junishi_gogyo, :primary_key => :code, :foreign_key => "junishi_code"
  has_many :tentoku, :foreign_key => "shi_id"
  has_many :tentoku_kan, :foreign_key => "shi_id"
  has_many :tentoku_shi, :foreign_key => "shi_id"
  has_many :meishiki_plr, :foreign_key => "chishi_id"
  has_many :junishi_relation, :primary_key => :id, :foreign_key => "junishi_code"
  has_many :relation_by_junishis, :through => :junishi_relation

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
    self.junishi_gogyo.where(:doseishi => doou(day))
  end

  def tentoku_kan?(jikkan)
    self.tentoku_kan.any?{|tentoku| tentoku.target?(jikkan)}
  end

  def tentoku_shi?(junishi)
    self.tentoku_shi.any?{|tentoku| tentoku.target?(junishi)}
  end

  def def_angle_relation
    self.relation_by_junishis.where(:relation_type => "ANGLE").each do |relation_define|
      self.instance_eval <<-EOS
        def #{relation_define.name}_angle
          return if (#{relation_define.function}).nil?
          (#{relation_define.function}) % ANGLE_CIRCLE
        end

        def #{relation_define.name}
          Junishi.by_angle(#{relation_define.name}_angle)
        end

        def #{relation_define.name}?(relate_junishi)
          relate_junishi.angle == #{relation_define.name}_angle
        end
      EOS
    end
  end

  def def_method_relation
    self.relation_by_junishis.where(:relation_type => "METHOD").each do |relation_define|
      self.instance_eval <<-EOS
        def #{relation_define.name}(target = nil)
          return if (#{relation_define.function}).nil?
          #{relation_define.function}
        end
      EOS
    end
  end

  def self.by_angle(angle)
    self.where(:angle => angle).first
  end

  protected

  def doou(day)
    return false if (self.angle - ANGLE_HALF_SHI) % ANGLE_RIGHT

    zoukan(day).gogyo_id == GOGYO_DO
  end
end

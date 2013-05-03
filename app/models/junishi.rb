class Junishi < ActiveRecord::Base
  after_initialize :def_relation

  SHI_COUNT = 12
  ANGLE_CIRCLE = 360
  ANGLE_HALF_CIRCLE = ANGLE_CIRCLE / 2
  ANGLE_SHI = ANGLE_CIRCLE / SHI_COUNT
  ANGLE_HALF_SHI = ANGLE_SHI / 2

  attr_accessible :code, :name, :angle
  
  has_many :junishi_term, :foreign_key => "shi_id"
  has_many :tentoku, :foreign_key => "shi_id"
  has_many :tentoku_kan, :foreign_key => "shi_id"
  has_many :tentoku_shi, :foreign_key => "shi_id"
  has_many :meishiki_plr, :foreign_key => "chishi_id"
  has_many :junishi_relation, :primary_key => :id, :foreign_key => "junishi_code"
  has_many :relation, :through => :junishi_relation

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
    term(day).zoukan if term(day).present?
  end

  def gogyo(day)
    term(day).junishi_gogyo if term(day).present?
  end

  def sangou
    Junishi.where(:angle => self.sangou_angle).scoped
  end

  def sangou?(relate_junishi)
    self.sangou_angle.any?{|angle| angle == relate_junishi.angle}
  end

  def tentoku_kan?(jikkan)
    self.tentoku_kan.any?{|tentoku| tentoku.target?(jikkan)}
  end

  def tentoku_shi?(junishi)
    self.tentoku_shi.any?{|tentoku| tentoku.target?(junishi)}
  end

  def def_relation
    self.relation.each do |relation_define|
      self.instance_eval <<-EOS
        def #{relation_define.name}_angle
          return if (#{relation_define.function}).nil?
          (#{relation_define.function}) % ANGLE_CIRCLE
        end

        def #{relation_define.name}
          Junishi.where(:angle => #{relation_define.name}_angle).first
        end

        def #{relation_define.name}?(relate_junishi)
          relate_junishi.angle == #{relation_define.name}_angle
        end
      EOS
    end
  end

  protected

  def term(day)
    self.junishi_term.find(nil) do |a_junishi_term|
      a_junishi_term.term_start <= day && a_junishi_term.term_end >= day
    end
  end

  def sangou_angle
    return (self.angle + ANGLE_CIRCLE / 3) % ANGLE_CIRCLE,
        (self.angle + ANGLE_CIRCLE / 3 * 2) % ANGLE_CIRCLE
  end
end

class Junishi < ActiveRecord::Base
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

  def gou
    Junishi.where(:angle => self.gou_angle).first
  end

  def gou?(relate_junishi)
    relate_junishi.angle == self.gou_angle
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

  protected

  def term(day)
    self.junishi_term.find(nil) do |a_junishi_term|
      a_junishi_term.term_start <= day && a_junishi_term.term_end >= day
    end
  end

  def gou_angle
    return if except_gou?
    -self.angle % ANGLE_CIRCLE
  end

  def except_gou?
    true if ((self.angle + ANGLE_SHI) % ANGLE_HALF_CIRCLE) < ANGLE_SHI * 2 + ANGLE_HALF_SHI
  end

  def sangou_angle
    return (self.angle + ANGLE_CIRCLE / 3) % ANGLE_CIRCLE,
        (self.angle + ANGLE_CIRCLE / 3 * 2) % ANGLE_CIRCLE
  end
end

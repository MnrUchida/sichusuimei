class Junishi < ActiveRecord::Base
  SHI_COUNT = 12
  attr_accessible :code, :name, :angle
  
  has_many :junishi_term, :foreign_key => "shi_id"
  has_many :tentoku, :foreign_key => "shi_id"
  has_many :meishiki_plr, :foreign_key => "chishi_id"

  def zoukan(day)
    term(day).zoukan if term(day).present?
  end

  def gogyo(day)
    term(day).junishi_gogyo if term(day).present?
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

  private

  def term(day)
    self.junishi_term.find(nil) do |a_junishi_term|
      a_junishi_term.term_start <= day && a_junishi_term.term_end >= day
    end
  end
end

class Junishi < ActiveRecord::Base
  SHI_COUNT = 12
  attr_accessible :code, :name
  
  has_many :junishi_term, :foreign_key => "shi_id"
  has_many :tentoku, :foreign_key => "shi_id"
  has_many :meishiki_plr, :foreign_key => "chishi_id"

  def zoukan(day)
    term(day).zoukan if term(day).present?
  end

  def gogyo(day)
    term(day).junishi_gogyo if term(day).present?
  end

  private

  def term(day)
    self.junishi_term.find(nil) do |a_junishi_term|
      a_junishi_term.term_start <= day && a_junishi_term.term_end >= day
    end
  end
end

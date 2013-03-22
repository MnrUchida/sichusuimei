class Junishi < ActiveRecord::Base
  SHI_COUNT = 12
  attr_accessible :shi_code, :shi_name
  
  has_many :junishi_term, :foreign_key => "shi_id"
  has_many :tentoku, :foreign_key => "shi_id"
  has_many :meishiki_plr, :foreign_key => "chishi_id"

  def getZoukan(day)
    zoukan = nil
    
    self.junishi_term.each do |_junishi_term|
      zoukan = _junishi_term.zoukan if _junishi_term.term_start <= day and _junishi_term.term_end >= day
      next
    end
    
    zoukan
  end 
end

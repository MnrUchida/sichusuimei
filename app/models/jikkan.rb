class Jikkan < ActiveRecord::Base
  JIKKAN_COUNT = 10

  attr_accessible :type, :inyou, :jikkan_code, :jikkan_name, :point, :point_day, :gogyo_id, :shi_teiou

  has_many :meishiki_olr, :foreign_key => "tenkan_id"
  has_many :meishiki_olr, :foreign_key => "zoukan_id"

  belongs_to :gogyo, :foreign_key => "gogyo_id",:class_name => 'Gogyo'

  def getHentsusei(_target_jikkan)
    _target_gogyo = _target_jikkan.gogyo.gogyo_code
    _self_gogyo = self.gogyo.gogyo_code
    _category = (_target_gogyo - _self_gogyo) % Gogyo::GOGYO_COUNT
    _inyou = _target_jikkan.inyou * self.inyou
    
    Hentsusei.find_by_category_and_inyou(_category, _inyou).hentsusei_code
  end

  def getHoun(_target_shi)
    _houn =(_target_shi.shi_code - self.shi_teiou) * self.inyou 
    _houn = (_houn + Junishi::SHI_COUNT / 2) % Junishi::SHI_COUNT
    Houn.find_by_houn_code(_houn).houn_code
  end

end

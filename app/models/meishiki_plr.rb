class MeishikiPlr < ActiveRecord::Base
  before_create :set_initial_value

  attr_accessible :chishi_id, :meishiki_id, :tenkan_id, :type, :zoukan_id
  
  belongs_to :meishiki, :foreign_key => "meishiki_id", class_name: 'Meishiki'
  belongs_to :chishi, :foreign_key => "chishi_id", class_name: 'Junishi'
  belongs_to :tenkan, :foreign_key => "tenkan_id", class_name: 'Jikkan'
  belongs_to :zoukan, :foreign_key => "zoukan_id", class_name: 'Jikkan'

  def reset_data
    self.set_initial_value
    self.save
  end

  def tenkan_hentsusei()
    meishiki.nisshu.hentsusei(self.tenkan)
  end

  def zoukan_hentsusei()
    meishiki.nisshu.hentsusei(self.zoukan)
  end

  def houn()
    meishiki.nisshu.houn(self.chishi)
  end

  def gogyo()
    gogyo_by_chishi.merge(gogyo_by_tenkan){|key, oldval, newval| oldval + newval}
  end

  protected

  def new_zoukan()
    self.chishi.zoukan(self.meishiki.day_from_sekki)
  end

  def day_for_tenkan()
    days_of_current_day - 6
  end

  def day_for_chishi()
    days_of_current_day - 10
  end

  def days_of_current_day
    days_of_current_year(self.meishiki.birthday.year - 1) + self.meishiki.birthday.strftime("%j").to_i
  end

  def days_of_current_year(year)
    year*365 + (year/4).truncate - (year/100).truncate + (year/ 400).truncate
  end

  def gogyo_by_chishi()
    chishi.gogyo(self.meishiki.day_from_sekki).inject(Hash.new) do |gogyos, chishi_gogyo|
      gogyos[chishi_gogyo.code] = chishi_gogyo.point
      gogyos
    end
  end

  def gogyo_by_tenkan()
    {tenkan.gogyo.code => tenkan.point}
  end

  def set_initial_value()
    self.tenkan_id = self.new_tenkan
    self.chishi_id = self.new_chishi
    self.zoukan_id = self.new_zoukan.id
  end

end

class MeishikiPlr < ActiveRecord::Base
  before_create :set_initial_value

  attr_accessible :chishi_id, :meishiki_id, :tenkan_id, :type, :zoukan_id
  
  belongs_to :meishiki, :foreign_key => "meishiki_id", class_name: 'Meishiki'
  belongs_to :chishi, :foreign_key => "chishi_id", class_name: 'Junishi'
  belongs_to :tenkan, :foreign_key => "tenkan_id", class_name: 'Jikkan'
  belongs_to :zoukan, :foreign_key => "zoukan_id", class_name: 'Jikkan'

  def set_initial_value()
    self.tenkan_id = self.new_tenkan
    self.chishi_id = self.new_chishi
    self.zoukan_id = self.new_zoukan.id
  end

  protected

  def new_zoukan()
    logger.debug "Watch!!!" + self.chishi.id.to_s
    self.chishi.getZoukan(self.meishiki.day_from_sekki)
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

end

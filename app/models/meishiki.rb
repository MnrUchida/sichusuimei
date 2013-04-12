require 'active_support'

class Meishiki < ActiveRecord::Base
  after_create :create_piller

  attr_accessible :id, :name, :sex, :birthday
  has_many  :meishiki_plr, :foreign_key => "meishiki_id"

  def sekki()
    @sekki = Sekki.include_day(self.birthday) if @sekki == nil
    @sekki
  end

  def day_from_sekki()
    self.birthday.to_datetime - self.sekki.date.to_datetime
  end

  def sekki_defined?()
    Sekki.is_defined_in_day?(self.birthday) &&
      Sekki.is_defined_in_day?(self.birthday - 1.month)
  end

  def piller(piller_type)
    piller_type.where(:meishiki_id => self.id).first
  end

  def create_piller()
    YearPiller.create(:meishiki_id => self.id)
    MonthPiller.create(:meishiki_id => self.id)
    DayPiller.create(:meishiki_id => self.id)
    TimePiller.create(:meishiki_id => self.id)
  end

  def nisshu
    piller(DayPiller).tenkan
  end

  def teikou
    piller(MonthPiller).zoukan
  end

  def gogyo()
    meishiki_plr.inject(Hash.new) do |meishiki_gogyo, piller|
      meishiki_gogyo.merge(piller.gogyo){|key, oldval, newval| oldval + newval}
    end
  end

end

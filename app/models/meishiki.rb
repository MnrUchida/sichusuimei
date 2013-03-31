require 'active_support'

class Meishiki < ActiveRecord::Base
  after_create :create_piller

  attr_accessible :id, :name, :sex, :birthday
  has_many  :meishiki_plr, :foreign_key => "meishiki_id"

  def sekki()
    @sekki = Sekki.include_day(self.birthday) if @sekki == nil
    @sekki
  end

  def cur_sekki=(value)
    @cur_sekki = Sekki.new(value)
  end
  def cur_sekki()
    self.where(:year => current_day.year, :month => current_day.month).first
  end

  def bef_sekki()
    self.where(:year => (current_day - 1.month).year, :month => (current_day - 1.month).month).first
  end
  def bef_sekki=(value)
    @bef_sekki = Sekki.new(value)
  end

  def aft_sekki()
    self.where(:year => (current_day + 1.month).year, :month => (current_day + 1.month).month).first
  end
  def aft_sekki=(value)
    @aft_sekki = Sekki.new(value)
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

end

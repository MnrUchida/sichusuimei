require 'active_support'

class Meishiki < ActiveRecord::Base
  after_create :create_piller

  attr_accessible :id, :name, :sex, :birthday, :meikyu
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

  def gogyo_with_array()
    gogyo_array = []
    Gogyo::GOGYO_COUNT.times do |index|
      gogyo_array[index] = {:gogyo => Gogyo.find_by_code(index), :point => 0}
    end

    gogyo.each do |gogyo_key, gogyo_value|
      index = gogyo_key

      gogyo_array[index] = {:gogyo => Gogyo.find_by_code(gogyo_key), :point => gogyo_value}
    end

    gogyo_array
  end

  def create_piller()
    YearPiller.create(:meishiki_id => self.id)
    MonthPiller.create(:meishiki_id => self.id)
    DayPiller.create(:meishiki_id => self.id)

    update_birth_day_by_meikyu

    TimePiller.create(:meishiki_id => self.id)
  end

  def update_birth_day_by_meikyu
    return unless self.meikyu

    self.birthday = self.birthday.beginning_of_day + time_of_birth_by_meikyu.hour
    self.save
  end

  def time_of_birth_by_meikyu
    meikyu = (piller(MonthPiller).chishi + ((Junishi::SHI_COUNT / 2) - self.birthday.day))

    meikyu.to_hour == 0 ? 12 : meikyu.to_hour
  end
end

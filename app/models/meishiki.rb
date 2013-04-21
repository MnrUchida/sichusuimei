require 'active_support'

class Meishiki < ActiveRecord::Base
  after_create :create_piller

  attr_accessible :id, :name, :sex, :birthday, :meikyu
  has_many  :meishiki_plr, :foreign_key => "meishiki_id"
  has_one  :year_pillar, :foreign_key => "meishiki_id", :class_name => "YearPiller"
  has_one  :month_pillar, :foreign_key => "meishiki_id", :class_name => "MonthPiller"
  has_one  :day_pillar, :foreign_key => "meishiki_id", :class_name => "DayPiller"
  has_one  :time_pillar, :foreign_key => "meishiki_id", :class_name => "TimePiller"

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

  def nisshu
    self.day_pillar.tenkan
  end

  def teikou
    self.month_pillar.zoukan
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
    self.create_year_pillar
    self.create_month_pillar
    self.create_day_pillar

    update_birth_day_by_meikyu
    self.create_time_pillar
  end

  def update_piller()
    self.year_pillar.reset_data
    self.month_pillar.reset_data
    self.day_pillar.reset_data

    update_birth_day_by_meikyu
    self.time_pillar.reset_data
  end

  def update_birth_day_by_meikyu
    return unless self.meikyu

    self.birthday = self.birthday.beginning_of_day + time_of_birth_by_meikyu.hour
    self.save
  end

  def time_of_birth_by_meikyu
    shi_of_time_by_meikyu.to_hour == 0 ? 12 : shi_of_time_by_meikyu.to_hour
  end

  def shi_of_time_by_meikyu
    self.month_pillar.chishi + ((Junishi::SHI_COUNT / 2) - self.birthday.day + 1)
  end
end

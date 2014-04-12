require 'active_support'
require 'forwardable'

class Meishiki < ActiveRecord::Base
  extend Forwardable

  after_create :create_piller

  attr_accessible :id, :name, :sex, :birthday, :meikyu

  belongs_to :person

  has_many  :meishiki_plr, :foreign_key => "meishiki_id"
  has_one  :year_pillar, :foreign_key => "meishiki_id", :class_name => "YearPillar"
  has_one  :month_pillar, :foreign_key => "meishiki_id", :class_name => "MonthPillar"
  has_one  :day_pillar, :foreign_key => "meishiki_id", :class_name => "DayPillar"
  has_one  :time_pillar, :foreign_key => "meishiki_id", :class_name => "TimePillar"

  def_delegator :day_pillar, :tenkan, :nisshu
  def_delegator :day_pillar, :kubou
  def_delegator :month_pillar, :zoukan, :teikou

  def set_person
    self.person_id = Person.find_by_name(self.name).id
    self.save
  end
  def sekki()
    @sekki = Sekki.include_day(self.person.birthday) if @sekki == nil
    @sekki
  end

  def day_from_sekki()
    (self.person.birthday.to_date - self.sekki.to_date).to_i
  end

  def day_for_next_sekki()
    (self.sekki.next.to_date - self.person.birthday.to_date).to_i
  end

  def tentoku
    return self.month_pillar.chishi.tentoku_kijin,
        self.month_pillar.chishi.tentoku_gou
  end

  def tentoku?(target)
    self.tentoku.any?{|tentoku| target.name == tentoku.name}
  end

  def kubou?(junishi)
    self.kubou.any?{|kubou| kubou.code == junishi.code}
  end

  def gogyo()
    meishiki_plr.inject(Hash.new) do |meishiki_gogyo, piller|
      meishiki_gogyo.merge(piller.gogyo){|key, oldval, newval| oldval + newval}
    end
  end

  def gogyo_with_array()
    gogyo_array = []
    Gogyo::GOGYO_COUNT.times do |index|
      gogyo_array[index] = {:gogyo => Gogyo.by_code(index), :point => 0}
    end

    gogyo.each do |gogyo_key, gogyo_value|
      index = gogyo_key

      gogyo_array[index] = {:gogyo => Gogyo.by_code(gogyo_key), :point => gogyo_value}
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

  def pillar(pillar_name)
    meishiki_plr.where(:type => pillar_name).first
  end

  def taiun(count)
    (0..count).map do |i|
      self.month_pillar.taiun(i * self.year_pillar.tenkan.inyou * self.person.sex.to_i)
    end
  end

  def ritsuun
    if self.year_pillar.tenkan.inyou * self.person.sex.to_i == 1
      day_for_next_sekki / 3.0
    else
      day_from_sekki / 3.0
    end
  end

  protected

  def update_birth_day_by_meikyu
    return unless self.person.meikyu

    self.person.birthday = self.person.birthday.beginning_of_day + time_of_birth_by_meikyu.hour
    self.person.save
  end

  def time_of_birth_by_meikyu
    shi_of_time_by_meikyu.to_hour == 0 ? 12 : shi_of_time_by_meikyu.to_hour
  end

  def shi_of_time_by_meikyu
    self.month_pillar.chishi + ((Junishi::SHI_COUNT / 2) - self.person.birthday.day + 1)
  end

end

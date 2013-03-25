require 'active_support'

class Meishiki < ActiveRecord::Base
  attr_accessible :id, :name, :sex, :birthday
  has_many  :meishiki_plr, :foreign_key => "meishiki_id"

  attr_accessor :time_of_birth
  attr_accessor :day_of_birth

  def sekki()
    @sekki = Sekki.include_day(self.birthday) if @sekki == nil
    @sekki
  end

  def day_from_sekki()
    self.birthday.to_datetime - self.sekki.date.to_datetime
  end

  def is_sekki_defined?()
    Sekki.is_defined_in_day?(self.birthday) &&
      Sekki.is_defined_in_day?(self.birthday - 1.month)
  end

end

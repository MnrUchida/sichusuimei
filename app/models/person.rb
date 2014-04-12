class Person < ActiveRecord::Base
  attr_accessible :name, :sex, :birthday, :meikyu

  has_one :meishiki
  has_many :person_jobs

  after_create {self.create_meishiki}

  def days_of_current_day
    days_of_current_year(self.birthday.year - 1) + self.birthday.strftime("%j").to_i
  end

  def days_of_current_year(year)
    year*365 + (year/4).truncate - (year/100).truncate + (year/ 400).truncate
  end

  def hours_of_current_hour
    (self.birthday.to_time.getlocal.hour + 1) % 24
  end

  def sekki_defined?()
    Sekki.is_defined_in_day?(self.birthday) &&
        Sekki.is_defined_in_day?(self.birthday - 1.month)
  end

end

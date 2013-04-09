require 'chronic'

class Sekki < ActiveRecord::Base
  attr_accessible :day, :hour, :month, :year

  def date()
    DateTime.new(self.year, self.month, self.day, self.hour)
  end

  def date=(value)
    datestr = Chronic.parse(value)
    self.year = datestr.year
    self.month = datestr.month
    self.day = datestr.day
    self.hour = datestr.hour
  end

  def self.include_day(day)
    sekki = self.of_year_and_month(day)
    if !sekki.nil? && (sekki.date <=> day) > 0
      sekki = self.of_year_and_month(day - 1.month)
    end
    sekki
  end

  def self.of_year_and_month(current_day)
    self.where(:year => current_day.year, :month => current_day.month).first
  end

  def self.is_defined_in_day?(day)
    self.exists?(:year => day.year, :month => day.month)
  end


end

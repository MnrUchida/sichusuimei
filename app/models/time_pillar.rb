class TimePillar < MeishikiPlr
  PillarRelationData.instance.def_relation('TimePillar')

  def pos
    3
  end

  protected
  def new_chishi
    ((time_for_chishi / 2) % Junishi::SHI_COUNT) + 1
  end

  def new_tenkan
    ((time_for_tenkan / 2) % Jikkan::JIKKAN_COUNT) + 1
  end

  def time_for_tenkan
    day_for_tenkan * 24 + self.meishiki.person.hours_of_current_hour
  end

  def time_for_chishi
    self.meishiki.person.days_of_current_day * 24 + self.meishiki.person.hours_of_current_hour
  end

end

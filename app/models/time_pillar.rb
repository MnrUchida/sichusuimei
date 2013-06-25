class TimePillar < MeishikiPlr
  PillarRelationData.instance.def_relation('TimePillar')

  protected
  def new_chishi
    ((time_for_chishi / 2) % Junishi::SHI_COUNT) + 1
  end

  def new_tenkan
    ((time_for_tenkan / 2) % Jikkan::JIKKAN_COUNT) + 1
  end

  def time_for_tenkan
    day_for_tenkan * 24 + hours_of_current_hour
  end

  def time_for_chishi
    days_of_current_day * 24 + hours_of_current_hour
  end

  def hours_of_current_hour
    (self.meishiki.birthday.to_time.getlocal.hour + 1) % 24
  end

end

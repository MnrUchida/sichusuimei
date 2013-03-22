class TimePiller < MeishikiPlr

  def getTimeInMeikyu
    month = @meishikiData.month

    if is_before_sekki?() == true then
      month = month - 1
    end

    return ((month + 6 - @meishikiData.day) % Chishi::CHISHI_COUNT) * 2
  end

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
    logger.debug self.meishiki.birthday.to_time.getlocal
    (self.meishiki.birthday.to_time.getlocal.hour + 1) % 24
  end

end

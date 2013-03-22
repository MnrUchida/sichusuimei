class DayPiller < MeishikiPlr

  def new_chishi
    (day_for_chishi % Junishi::SHI_COUNT) + 1
  end

  def new_tenkan
    (day_for_tenkan % Jikkan::JIKKAN_COUNT) + 1
  end

end

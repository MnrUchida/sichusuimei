class YearPillar < MeishikiPlr

  def new_chishi
    (year % Junishi::SHI_COUNT) + 1
  end

  def new_tenkan
    (year % Jikkan::JIKKAN_COUNT) + 1
  end

  def year()
    self.meishiki.sekki.year - 4
  end
end

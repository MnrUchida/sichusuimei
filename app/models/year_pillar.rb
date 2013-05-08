class YearPillar < MeishikiPlr

  def new_chishi
    (year % Junishi::SHI_COUNT) + 1
  end

  def new_tenkan
    (year % Jikkan::JIKKAN_COUNT) + 1
  end

  def year()
    year = self.meishiki.sekki.year - 4
    year -= 1 if self.meishiki.sekki.month == 1
    year
  end
end

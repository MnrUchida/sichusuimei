
class MonthPiller < MeishikiPlr
protected
  def new_chishi
    (month_for_chishi % Junishi::SHI_COUNT) + 1
  end

  def new_tenkan
    (month_for_tenkan % Jikkan::JIKKAN_COUNT) + 1
  end

  def month_for_tenkan()
    (self.meishiki.sekki.year - 1) * 12 + (self.meishiki.sekki.month - 6)
  end

  def month_for_chishi()
    self.meishiki.sekki.month
  end
end

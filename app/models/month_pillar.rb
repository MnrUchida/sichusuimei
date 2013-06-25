
class MonthPillar < MeishikiPlr

  PillarRelationData.instance.def_relation('MonthPillar')

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

  def gogyo_by_chishi()
    chishi.gogyo(self.meishiki.day_from_sekki).inject(Hash.new) do |gogyos, chishi_gogyo|
      gogyos[chishi_gogyo.code] = chishi_gogyo.point_month
      gogyos
    end
  end

end

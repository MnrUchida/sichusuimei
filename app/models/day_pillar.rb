class DayPillar < MeishikiPlr

  PillarRelationData.instance.def_relation('DayPillar')

  def pos
    2
  end

  def new_chishi
    (day_for_chishi % Junishi::SHI_COUNT) + 1
  end

  def new_tenkan
    (day_for_tenkan % Jikkan::JIKKAN_COUNT) + 1
  end

  def tenkan_hentsusei()
    meishiki.nisshu.hentsusei(meishiki.teikou)
  end

  def gogyo_by_tenkan()
    {tenkan.gogyo.code => tenkan.point_day}
  end

end

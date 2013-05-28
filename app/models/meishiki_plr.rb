class MeishikiPlr < ActiveRecord::Base
  before_create :set_initial_value
  after_initialize :def_relation

  attr_accessible :chishi_id, :meishiki_id, :tenkan_id, :type, :zoukan_id
  
  belongs_to :meishiki, :foreign_key => "meishiki_id", class_name: 'Meishiki'
  belongs_to :chishi, :foreign_key => "chishi_id", class_name: 'Junishi'
  belongs_to :tenkan, :foreign_key => "tenkan_id", class_name: 'Jikkan'
  belongs_to :zoukan, :foreign_key => "zoukan_id", class_name: 'Jikkan'

  def reset_data
    self.set_initial_value
    self.save
  end

  def tentoku?(target)
    self.meishiki.tentoku?(target)
  end

  def kubou?()
    self.meishiki.kubou?(self.chishi)
  end

  def tenkan_hentsusei()
    meishiki.nisshu.hentsusei(self.tenkan)
  end

  def zoukan_hentsusei()
    meishiki.nisshu.hentsusei(self.zoukan)
  end

  def houn()
    meishiki.nisshu.houn(self.chishi)
  end

  def gogyo()
    gogyo_by_chishi.merge(gogyo_by_tenkan){|key, oldval, newval| oldval + newval}
  end

  def set_initial_value()
    self.tenkan_id = self.new_tenkan
    self.chishi_id = self.new_chishi
    self.zoukan_id = self.new_zoukan.id
  end

  def kubou
    return self.kubou_first, self.kubou_first + 1
  end

  #def kangou?(pillar)
  #  self.tenkan.gou?(pillar.tenkan)
  #end
  #
  #def shigou?(pillar)
  #   self.chishi.gou?(pillar.chishi)
  #end
  #
  #def sangou?(pillar, pillar2)
  #  self.chishi.sangou?(pillar.chishi) && self.chishi.sangou?(pillar2.chishi)
  #end

  protected

  def new_zoukan()
    self.chishi.zoukan(self.meishiki.day_from_sekki)
  end

  def day_for_tenkan()
    days_of_current_day - 6
  end

  def day_for_chishi()
    days_of_current_day - 10
  end

  def days_of_current_day
    days_of_current_year(self.meishiki.birthday.year - 1) + self.meishiki.birthday.strftime("%j").to_i
  end

  def days_of_current_year(year)
    year*365 + (year/4).truncate - (year/100).truncate + (year/ 400).truncate
  end

  def gogyo_by_chishi()
    chishi.gogyo(self.meishiki.day_from_sekki).inject(Hash.new) do |gogyos, chishi_gogyo|
      gogyos[chishi_gogyo.code] = chishi_gogyo.point
      gogyos
    end
  end

  def gogyo_by_tenkan()
    {tenkan.gogyo.code => tenkan.point}
  end

  def kubou_first
    self.chishi + (Jikkan::JIKKAN_COUNT - self.tenkan.code)
  end

  def def_relation
    PillarRelationPillar.where(:base_pillar => self.type).group(:pillar_relation_id).each {|pillar|
      self.instance_eval <<-EOS
        def #{pillar.pillar_relation.name}(pillar)
          target_pillar = pillar[:target_pillar]
          target2_pillar = pillar[:target2_pillar]

          #{pillar.pillar_relation.method_define}
        end
      EOS
    }
  end
end

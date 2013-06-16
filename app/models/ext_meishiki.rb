require 'forwardable'

class ExtMeishiki < SimpleModel
  extend Forwardable

  def_delegators :meishiki, :name, :name= , :sex, :sex=, :birthday, :birthday=, :meikyu, :meikyu=

  attr_writer :meishiki

  def cur_sekki_date=(value)
    @cur_sekki = Sekki.new() if @cur_sekki.nil?
    @cur_sekki.date = value
  end
  def cur_sekki_date()
    sekki_date(0.month).strftime("%Y/%m/%d %H:%M")
  end

  def bef_sekki_date()
    sekki_date(-1.month).strftime("%Y/%m/%d %H:%M")
  end
  def bef_sekki_date=(value)
    @bef_sekki = Sekki.new() if @bef_sekki.nil?
    @bef_sekki.date = value
  end

  def aft_sekki_date()
    sekki_date(1.month).strftime("%Y/%m/%d %H:%M")
  end
  def aft_sekki_date=(value)
    @aft_sekki = Sekki.new() if @aft_sekki.nil?
    @aft_sekki.date = value
  end

  def cur_sekki_exists?()
    Sekki.exists?(sekki_where(0.month))
  end
  def bef_sekki_exists?()
    Sekki.exists?(sekki_where(-1.month))
  end
  def aft_sekki_exists?()
    Sekki.exists?(sekki_where(1.month))
  end

  def meishiki()
    @meishiki = Meishiki.new() if @meishiki.nil?
    @meishiki
  end

  def ext_meishikis_path
    meishiki.meishikis_path
  end

  def save
    @cur_sekki.save
    @bef_sekki.save
    @aft_sekki.save
    meishiki.save
  end

  protected

  def sekki_date(month)
    sekki = Sekki.where(sekki_where(month)).first
    if sekki.present?
      sekki.date
    else
      birthday + month
    end
  end

  def sekki_where(month)
    {:year => (birthday + month).year, :month => (birthday + month).month}
  end

end
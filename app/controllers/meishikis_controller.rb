# coding : utf-8

class MeishikisController < ApplicationController
  require 'gruff'

  before_filter :set_meishiki, :only => [:image, :show, :edit, :update, :destroy, :taiun]

  def image
    gogyo = @meishiki.gogyo_with_array

    g = Gruff::Spider.new 10,500
    g.base_angle = -Math::PI * @meishiki.nisshu.gogyo.code / Gogyo::GOGYO_COUNT * 2

    g.theme_37signals
    g.font = "/usr/share/fonts/truetype/takao-gothic/TakaoPGothic.ttf"
    gogyo.each do |data|
      g.data data[:gogyo].name + " " + data[:point].to_s, [data[:point]] ,data[:gogyo].color
    end

    send_data(g.to_blob, :type => 'image/png', :disposition=>'inline')
  end

  def index
    @meishikis = Meishiki.all
  end

  def show
    @ext_meishiki = ExtMeishiki.new(:meishiki => @meishiki)
  end

  def new
    @meishiki = Meishiki.new
  end

  def edit
  end

  def create
    @meishiki = Meishiki.new(params[:meishiki])

    unless @meishiki.sekki_defined?
      @ext_meishiki = ExtMeishiki.new(:meishiki => @meishiki)

      render action: :sekki
      return
    end

    unless @meishiki.save
      render action: :new
      return
    end
    redirect_to @meishiki, notice: 'Meishiki was successfully created.'
  end

  def update
    unless @meishiki.update_attributes(params[:meishiki])
      render action: :edit
      return
    end

    @meishiki.update_piller
    redirect_to @meishiki, notice: 'Meishiki was successfully updated.'

  end

  def destroy
    @meishiki.destroy

    redirect_to meishikis_url
  end

  def create_sekki
    @ext_meishiki = ExtMeishiki.new(params[:ext_meishiki])

    unless @ext_meishiki.save
      render action: "new"
      return
    end

    redirect_to @ext_meishiki.meishiki, notice: 'Meishiki was successfully created.'
  end

  def taiun
    @taiuns = @meishiki.taiun(10)
  end

  private
  def set_meishiki
    @meishiki = Meishiki.find(params[:id])
  end

end

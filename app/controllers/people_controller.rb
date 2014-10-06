# coding : utf-8

class PeopleController < ApplicationController
  require 'gruff'

  before_filter :set_meishiki, :only => [:image, :show, :edit, :update, :destroy, :taiun]

  def image
    gogyo = @person.meishiki.gogyo_with_array

    g = Gruff::Spider.new 10,500
    g.base_angle = -Math::PI * @person.meishiki.nisshu.gogyo.code / Gogyo::GOGYO_COUNT * 2

    g.theme_37signals
    g.font = "/usr/share/fonts/truetype/takao-gothic/TakaoPGothic.ttf"
    gogyo.each do |data|
      g.data data[:gogyo].name + " " + data[:point].to_s, [data[:point]] ,data[:gogyo].color
    end

    send_data(g.to_blob, :type => 'image/png', :disposition=>'inline')
  end

  def index
    @people = Person.scoped.order(:id).reverse_order
  end

  def show
    @ext_meishiki = ExtMeishiki.new(:person => @person)
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = Person.new(params[:person])

    unless @person.sekki_defined?
      @ext_meishiki = ExtMeishiki.new(:person => @person)

      render action: :sekki
      return
    end

    unless @person.save
      render action: :new
      return
    end
    redirect_to @person, notice: 'Meishiki was successfully created.'
  end

  def update
    unless @person.update_attributes(params[:person])
      render action: :edit
      return
    end

    @person.meishiki.update_piller
    redirect_to @person, notice: 'Meishiki was successfully updated.'

  end

  def destroy
    @person.destroy

    redirect_to persons_url
  end

  def create_sekki
    @ext_meishiki = ExtMeishiki.new()
    @ext_meishiki.set_data(params[:ext_meishiki])

    unless @ext_meishiki.save
      render action: "new"
      return
    end

    redirect_to @ext_meishiki.person, notice: 'Meishiki was successfully created.'
  end

  def taiun
    @taiuns = @person.meishiki.taiun(10)
  end

  private
  def set_meishiki
    @person = Person.find(params[:id])
  end

end

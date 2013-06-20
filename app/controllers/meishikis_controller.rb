# coding : utf-8

class MeishikisController < ApplicationController
  require 'gruff'

  def image
    @meishiki = Meishiki.find(params[:id])

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

  # GET /meishikis
  # GET /meishikis.json
  def index
    @meishikis = Meishiki.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meishikis }
    end
  end

  # GET /meishikis/1
  # GET /meishikis/1.json
  def show
    @meishiki = Meishiki.find(params[:id])
    @ext_meishiki = ExtMeishiki.new(:meishiki => @meishiki)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meishiki }
    end
  end

  # GET /meishikis/new
  # GET /meishikis/new.json
  def new
    @meishiki = Meishiki.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meishiki }
    end
  end

  # GET /meishikis/1/edit
  def edit
    @meishiki = Meishiki.find(params[:id])
  end

  # POST /meishikis
  # POST /meishikis.json
  def create
    @meishiki = Meishiki.new(params[:meishiki])

    unless @meishiki.sekki_defined?
      @ext_meishiki = ExtMeishiki.new(:meishiki => @meishiki)
      respond_to do |format|
        format.html { render action: "sekki" }
      end
      return
    end

    respond_to do |format|
      if @meishiki.save
        format.html { redirect_to @meishiki, notice: 'Meishiki was successfully created.' }
        format.json { render json: @meishiki, status: :created, location: @meishiki }
      else
        format.html { render action: "new" }
        format.json { render json: @meishiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meishikis/1
  # PUT /meishikis/1.json
  def update
    @meishiki = Meishiki.find(params[:id])

    respond_to do |format|
      if @meishiki.update_attributes(params[:meishiki])
        @meishiki.update_piller
        format.html { redirect_to @meishiki, notice: 'Meishiki was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meishiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meishikis/1
  # DELETE /meishikis/1.json
  def destroy
    @meishiki = Meishiki.find(params[:id])
    @meishiki.destroy

    respond_to do |format|
      format.html { redirect_to meishikis_url }
      format.json { head :no_content }
    end
  end

  def create_sekki
    @ext_meishiki = ExtMeishiki.new(params[:ext_meishiki])

    respond_to do |format|
      if @ext_meishiki.save
        format.html { redirect_to @ext_meishiki.meishiki, notice: 'Meishiki was successfully created.' }
        format.json { render json: @ext_meishiki.meishiki, status: :created, location: @ext_meishiki.meishiki }
      else
        format.html { render action: "new" }
        format.json { render json: @ext_meishiki.meishiki.errors, status: :unprocessable_entity }
      end
    end
  end
end

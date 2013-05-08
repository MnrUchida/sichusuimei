# coding : utf-8

class PillarRelationsController < ApplicationController

  def index
    @pillar_relations = PillarRelation.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @pillar_relation = PillarRelation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @pillar_relation = PillarRelation.new
    5.times {@pillar_relation.pillar_relation_pillars.build}

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /meishikis/1/edit
  def edit
    @pillar_relation = PillarRelation.find(params[:id])
  end

  # POST /meishikis
  # POST /meishikis.json
  def create
    @pillar_relation = PillarRelation.new(params[:pillar_relation])

    respond_to do |format|
      if @pillar_relation.save
        format.html { redirect_to @pillar_relation, notice: 'Meishiki was successfully created.' }
        format.json { render json: @pillar_relation, status: :created, location: @pillar_relation }
      else
        format.html { render action: "new" }
        format.json { render json: @pillar_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meishikis/1
  # PUT /meishikis/1.json
  def update
    @pillar_relation = PillarRelation.find(params[:id])

    respond_to do |format|
      if @pillar_relation.update_attributes(params[:pillar_relation])
        format.html { redirect_to @pillar_relation, notice: 'Meishiki was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pillar_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meishikis/1
  # DELETE /meishikis/1.json
  def destroy
    @pillar_relation = PillarRelation.find(params[:id])
    @pillar_relation.destroy

    respond_to do |format|
      format.html { redirect_to relations_url }
      format.json { head :no_content }
    end
  end
end

# coding : utf-8

class RelationsController < ApplicationController

  def index
    @relations = Relation.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @relation = Relation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @relation = Relation.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /meishikis/1/edit
  def edit
    @relation = Relation.find(params[:id])
  end

  # POST /meishikis
  # POST /meishikis.json
  def create
    @relation = Relation.new(params[:relation])

    respond_to do |format|
      if @relation.save
        format.html { redirect_to @relation, notice: 'Meishiki was successfully created.' }
        format.json { render json: @relation, status: :created, location: @relation }
      else
        format.html { render action: "new" }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meishikis/1
  # PUT /meishikis/1.json
  def update
    @relation = Relation.find(params[:id])

    respond_to do |format|
      if @relation.update_attributes(params[:relation])
        format.html { redirect_to @relation, notice: 'Meishiki was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meishikis/1
  # DELETE /meishikis/1.json
  def destroy
    @relation = Relation.find(params[:id])
    @relation.destroy

    respond_to do |format|
      format.html { redirect_to relations_url }
      format.json { head :no_content }
    end
  end
end

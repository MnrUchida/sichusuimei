# coding : utf-8

class JunishiRelationsController < ApplicationController

  def index
    @junishi_relations = JunishiRelation.scoped.order(:relation_code)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # DELETE /meishikis/1
  # DELETE /meishikis/1.json
  def destroy
    @junishi_relation = JunishiRelation.find(params[:id])
    @junishi_relation.destroy

    respond_to do |format|
      format.html { redirect_to junishi_relations_url }
      format.json { head :no_content }
    end
  end
end

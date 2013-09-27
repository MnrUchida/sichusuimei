class DropTables < ActiveRecord::Migration
  def change
    drop_table :gogyos
    drop_table :hentsuseis
    drop_table :houns
    drop_table :jikkans
    drop_table :junishi_gogyos
    drop_table :junishi_relations
    drop_table :junishi_terms
    drop_table :junishis
    drop_table :pillar_relation_pillars
    drop_table :pillar_relations
    drop_table :relations
    drop_table :tentokus
    drop_table :zoukans

    remove_column :meishikis, :name
    remove_column :meishikis, :sex
    remove_column :meishikis, :birthday
    remove_column :meishikis, :meikyu
  end
end

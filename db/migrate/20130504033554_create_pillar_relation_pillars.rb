class CreatePillarRelationPillars < ActiveRecord::Migration
  def change
    create_table :pillar_relation_pillars do |t|
      t.integer :pillar_relation_id
      t.string :base_pillar
      t.string :target_pillar
      t.string :target2_pillar

      t.timestamps
    end
  end
end

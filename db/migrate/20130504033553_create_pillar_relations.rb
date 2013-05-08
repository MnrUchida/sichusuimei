class CreatePillarRelations < ActiveRecord::Migration
  def change
    create_table :pillar_relations do |t|
      t.string :name
      t.string :subject
      t.string :method
      t.string :arg

      t.timestamps
    end
  end
end

class CreateJunishiRelations < ActiveRecord::Migration
  def change
    create_table :junishi_relations do |t|
      t.integer :junishi_code
      t.integer :relation_code

      t.timestamps
    end
  end
end

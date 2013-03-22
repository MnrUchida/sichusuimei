class CreateJunishiTerms < ActiveRecord::Migration
  def change
    create_table :junishi_terms do |t|
      t.integer :shi_id
      t.integer :term_start
      t.integer :term_end
      t.integer :zoukan_id

      t.timestamps
    end
  end
end

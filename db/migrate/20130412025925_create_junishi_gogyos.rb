class CreateJunishiGogyos < ActiveRecord::Migration
  def change
    create_table :junishi_gogyos do |t|
      t.integer :junishi_term_id
      t.integer :gogyo_id
      t.float :point
      t.float :point_month

      t.timestamps
    end
  end
end

class CreateJikkans < ActiveRecord::Migration
  def change
    create_table :jikkans do |t|
      t.integer :jikkan_code
      t.string :jikkan_name
      t.integer :inyou
      t.float :point
      t.float :point_day
      t.integer :gogyo_id
      t.integer :shi_teiou

      t.timestamps
    end
  end
end

class CreateGogyos < ActiveRecord::Migration
  def change
    create_table :gogyos do |t|
      t.integer :gogyo_code
      t.string :gogyo_name

      t.timestamps
    end
  end
end

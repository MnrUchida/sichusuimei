class CreateJunishis < ActiveRecord::Migration
  def change
    create_table :junishis do |t|
      t.integer :shi_code
      t.string :shi_name

      t.timestamps
    end
  end
end

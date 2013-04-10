class CreateJunishis < ActiveRecord::Migration
  def change
    create_table :junishis do |t|
      t.integer :code
      t.string :name

      t.timestamps
    end
  end
end

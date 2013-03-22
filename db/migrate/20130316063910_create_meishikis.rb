class CreateMeishikis < ActiveRecord::Migration
  def change
    create_table :meishikis do |t|
      t.string :name
      t.string :sex
      t.datetime :birthday

      t.timestamps
    end
  end
end

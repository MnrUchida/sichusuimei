class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :sex
      t.datetime :birthday
      t.boolean :meikyu

      t.timestamps
    end
  end
end

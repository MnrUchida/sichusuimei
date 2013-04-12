class CreateGogyos < ActiveRecord::Migration
  def change
    create_table :gogyos do |t|
      t.integer :code
      t.string :name

      t.timestamps
    end
  end
end

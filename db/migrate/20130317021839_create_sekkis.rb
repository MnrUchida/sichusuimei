class CreateSekkis < ActiveRecord::Migration
  def change
    create_table :sekkis do |t|
      t.integer :year
      t.integer :month
      t.integer :day
      t.integer :hour

      t.timestamps
    end
  end
end

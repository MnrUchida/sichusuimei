class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :code

      t.string :name
      t.string :function
      t.string :except

      t.timestamps
    end
  end
end

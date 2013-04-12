class CreateHouns < ActiveRecord::Migration
  def change
    create_table :houns do |t|
      t.string :name
      t.integer :code
      t.integer :point

      t.timestamps
    end
  end
end

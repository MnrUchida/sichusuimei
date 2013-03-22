class CreateHouns < ActiveRecord::Migration
  def change
    create_table :houns do |t|
      t.string :houn_name
      t.integer :houn_code
      t.integer :point

      t.timestamps
    end
  end
end

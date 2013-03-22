class CreateHentsuseis < ActiveRecord::Migration
  def change
    create_table :hentsuseis do |t|
      t.integer :hentsusei_code
      t.string :hentsusei_name
      t.integer :category
      t.integer :inyou
      t.integer :point

      t.timestamps
    end
  end
end

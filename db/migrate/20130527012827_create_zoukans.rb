class CreateZoukans < ActiveRecord::Migration
  def change
    create_table :zoukans do |t|
      t.integer :jikkan_code
      t.integer :start_angle
      t.integer :span_angle

      t.timestamps
    end
  end
end

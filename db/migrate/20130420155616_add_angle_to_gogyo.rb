class AddAngleToGogyo < ActiveRecord::Migration
  def change
    add_column :gogyos, :angle, :integer
    add_column :junishis, :angle, :integer
    add_column :houns, :angle, :integer
  end
end

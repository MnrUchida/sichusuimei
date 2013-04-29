class AddDescriptionToRelation < ActiveRecord::Migration
  def change
    add_column :relations, :description, :string
  end
end

class RenameAngleRelationToRelationByJunishi < ActiveRecord::Migration
  def change
    add_column :relations, :relation_type, :string
  end
end

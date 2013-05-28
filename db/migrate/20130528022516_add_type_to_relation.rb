class AddTypeToRelation < ActiveRecord::Migration
  def change
    add_column :relations, :type, :string
  end
end

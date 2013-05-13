class ModifyColumnMethod < ActiveRecord::Migration
  def change
    remove_column :pillar_relations, :method
    remove_column :pillar_relations, :subject
    remove_column :pillar_relations, :arg
    add_column :pillar_relations, :method_define, :string
  end
end

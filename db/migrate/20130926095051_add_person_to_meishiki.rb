class AddPersonToMeishiki < ActiveRecord::Migration
  def change
    add_column :meishikis, :person_id, :integer
  end
end

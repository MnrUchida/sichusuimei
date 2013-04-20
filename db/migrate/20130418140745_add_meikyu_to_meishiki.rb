class AddMeikyuToMeishiki < ActiveRecord::Migration
  def change
    add_column :meishikis, :meikyu, :boolean, :default => false
  end
end

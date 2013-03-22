class CreateMeishikiPlrs < ActiveRecord::Migration
  def change
    create_table :meishiki_plrs do |t|
      t.integer :meishiki_id
      t.string :type
      t.integer :tenkan_id
      t.integer :chishi_id
      t.integer :zoukan_id

      t.timestamps
    end
  end
end

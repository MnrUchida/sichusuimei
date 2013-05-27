class ModifyColumnJunishiGogyo < ActiveRecord::Migration
  def change
    remove_column :junishi_gogyos, :junishi_term_id
    add_column :junishi_gogyos, :junishi_code, :integer
    add_column :junishi_gogyos, :doseishi, :integer
  end
end

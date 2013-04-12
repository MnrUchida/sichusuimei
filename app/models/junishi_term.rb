class JunishiTerm < ActiveRecord::Base
  attr_accessible :shi_id, :term_end, :term_start, :zoukan_id

  belongs_to :junishi, :primary_key => "shi_id",:class_name => 'Junishi'
  has_one :zoukan, :primary_key => "zoukan_id", :foreign_key => "id", :class_name => 'Jikkan'
  has_many :junishi_gogyo
end

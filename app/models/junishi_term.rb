class JunishiTerm < ActiveRecord::Base
  attr_accessible :shi_id, :term_end, :term_start, :zoukan_id

  belongs_to :junishi, :primary_key => "shi_id",:class_name => 'Junishi'
  has_many :junishi_gogyo
end

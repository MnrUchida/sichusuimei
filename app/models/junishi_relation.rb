class JunishiRelation < ActiveRecord::Base
  attr_accessible :junishi_code, :relation_code

  belongs_to :relation, :foreign_key => :relation_code, :primary_key => :id
  belongs_to :junishi, :foreign_key => :junishi_code, :primary_key => :id

end

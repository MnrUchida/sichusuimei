class PillarRelation < ActiveRecord::Base
  attr_accessible :name ,:method_define
  has_many :pillar_relation_pillars , :order => "base_pillar, target_pillar"

  #accepts_nested_attributes_for :pillar_relation_pillars

  def save_pillar(pillar_group)
    PillarRelationPillar.save_with_group(self.id, pillar_group)
  end
end

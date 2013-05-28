class RelationByJunishi < Relation
  attr_accessible :junishis, :junishi_ids

  has_many :junishi_relations, :primary_key => :id, :foreign_key => "relation_code"
  has_many :junishis, :through => :junishi_relations

end

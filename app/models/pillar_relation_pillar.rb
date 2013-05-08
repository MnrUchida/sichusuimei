class PillarRelationPillar < ActiveRecord::Base
  attr_accessible :pillar_relation_id ,:base_pillar ,:target_pillar ,:target2_pillar

  def self.pillars
    self.scoped.group_by{|item| item.base_pillar}.inject(Hash.new) do |groups, (pillar, group)|
      groups[pillar] = group.group_by{|item| item.target_pillar}
    end
  end

  def pillar_array
    SelectParameters.get_value("pillar")
  end
end

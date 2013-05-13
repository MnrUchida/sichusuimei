class PillarRelationPillar < ActiveRecord::Base
  attr_accessible :pillar_relation_id ,:base_pillar ,:target_pillar ,:target2_pillar
  belongs_to :pillar_relation

  def self.by_group
    pillar_group = self.init_groups
    self.group.each do |base_pillar, group|

      group.each do |target_pillar, target_group|
        pillar_group[base_pillar][target_pillar][:value] = true
        target_group.each do |target_pillar2, target_group2|
          pillar_group[base_pillar][target_pillar][target_pillar2][:value] = true unless target_group2.nil?
        end
      end
    end

    pillar_group
  end

  def self.save_with_group(pillar_relation_id, pillar_group)
    record_data = {:pillar_relation_id => pillar_relation_id}

    pillar_group.each do |base_pillar, group|
      record_data[:base_pillar] = base_pillar

      group.each do |target_pillar, target_group|
        record_data[:target_pillar] = target_pillar
        create_or_delete_record(record_data, target_group)

        target_group.delete(:value.to_s)
        target_group.each do |target2_pillar, target2_group|

          record_data[:target2_pillar] = target2_pillar
          create_or_delete_record(record_data, target2_group)
        end
      end
    end
  end

  private
  def self.create_or_delete_record(record_data, target_group)

    record = PillarRelationPillar.where(record_data).first
    if target_group[:value.to_s]
      PillarRelationPillar.create(record_data) if record.nil?
    else
      record.delete unless record.nil?
    end
  end

  def self.group
    self.scoped.group_by{|item| item.base_pillar}.inject(Hash.new) do |groups, (pillar, group)|
      groups[pillar] = group.group_by{|item| item.target_pillar}
      groups
    end
  end

  def self.init_groups
    set_default_to_group(Hash.new) do
      set_default_to_group do
        set_default_to_group do
          {:value => false}
        end
      end
    end
  end

  def self.set_default_to_group(initial = {:value => false})
    SelectParameters.get_value("pillar").inject(initial) do |target_groups, (key, value)|
      target_groups[value] = yield
      target_groups
    end
  end
end

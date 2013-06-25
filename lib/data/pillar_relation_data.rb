require 'yaml'
require 'base_data'

class PillarRelationData
  include BaseData

  @yaml_data = Hash.new

  def self.instance
    @instance ||= self.new
  end

  def initialize
    @yaml_data = YAML.load_file('config/data/pillar_relation.yml')
    @data = @yaml_data["METHOD"]
  end

  def def_relation(pillar)
    @data.each do |method_name, data|
      data['relation'].each do |base_pillar, target_pillar|
        def_pillar_method(base_pillar ,method_name , data['method']) if pillar == base_pillar
      end
    end
  end

  def pillars_by_relation_name(relation_name)
    @data[relation_name]['relation'].inject([]) do |pillars, (pillar_name, data)|
      pillar_relation = {:base_pillar => pillar_name, :target => []}
      pillars + target_pillars(pillar_relation,data)
    end
  end

  private

  def def_pillar_method(base_pillar, method_name, method_define)
    eval(base_pillar).class_eval <<-EOS
      def #{method_name}(pillar)
        target_pillar = pillar[:target_pillar]
        target2_pillar = pillar[:target2_pillar]

        #{method_define}
      end
    EOS
  end

  def target_pillars(base_pillars, relation)
    return [base_pillars] if relation.nil?

    relation.inject([]) do |pillars,  (pillar_name, data)|
      target = base_pillars.clone
      target[:target] = base_pillars[:target].clone
      target[:target] << pillar_name

      pillars + target_pillars(target, data)
    end
  end

end

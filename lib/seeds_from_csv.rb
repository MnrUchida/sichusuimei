# coding : utf-8

require 'csv'

module SeedsFromCsv

  def read_all_seeds
    read_pillar_relation()

    read_pillar_relation_pillar()
  end

  # 関連データ取り込み
  def read_pillar_relation
    PillarRelation.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'pillar_relations'")

    _file_path = File.expand_path('db/seeds/pillar_relation.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      PillarRelation.create(:name => row[0], :method_define => row[1])
    end
  end

  # 関連データ取り込み
  def read_pillar_relation_pillar
    PillarRelationPillar.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'pillar_relation_pillars'")

    _file_path = File.expand_path('db/seeds/pillar_relation_pillar.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      PillarRelationPillar.create(:pillar_relation_id => row[0] ,:base_pillar => row[1] ,:target_pillar => row[2] ,:target2_pillar => row[3])
    end
  end
end

